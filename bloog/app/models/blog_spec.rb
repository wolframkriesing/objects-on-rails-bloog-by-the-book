require "minitest/autorun"
require_relative "./blog"
# require "ostruct"

describe Blog do
  let(:blog) { Blog.new }

  it "has no entries" do
    blog.entries.must_be_empty
  end

  describe "#new_post" do
    before do
      @new_post = OpenStruct.new
      blog.post_source = -> { @new_post }
    end
    it "returns a new post" do
      blog.new_post.must_equal @new_post
    end
    it "sets the post’s blog reference to itself" do
      blog.new_post.blog.must_equal(blog)
    end
    it "accepts an attribute hash on behalf of the post maker" do
      post_source = MiniTest::Mock.new
      post_source.expect(:call, @new_post, [{ x: 42, y: "z" }])
      blog.post_source = post_source
      blog.new_post(x: 42, y: "z")
      post_source.verify
    end
  end

  describe "#add_entry" do
    it "adds the entry to the blog" do
      entry = Object.new
      blog.add_entry(entry)
      blog.entries.must_include(entry)
    end
  end
end