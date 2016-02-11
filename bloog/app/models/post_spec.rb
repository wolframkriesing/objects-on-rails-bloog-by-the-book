require "minitest/autorun"

# this piece is also just added as in the PostController
# only for form to render :(
# for-form-only START
module ActiveModel 
  module Naming; end 
  module Conversion; end
end
# for-form-only END
require_relative "./post"

describe Post do
  let(:post) { Post.new }
  
  it "starts with blank attributes" do
    post.title.must_be_nil 
    post.body.must_be_nil
  end
  it "supports reading and writing a title" do
    post.title = "foo"
    post.title.must_equal "foo"
  end
  it "supports reading and writing a post body" do
    post.body = "foo"
    post.body.must_equal "foo"
  end
  it "supports reading and writing a blog reference" do
    blog = Object.new
    post.blog = blog
    post.blog.must_equal blog
  end
  it "supports setting attributes in the initializer" do 
    post = Post.new(title: "mytitle", body: "mybody") 
    post.title.must_equal "mytitle"
    post.body.must_equal "mybody"
  end
  describe "#publish" do
    before do
      @blog = MiniTest::Mock.new
      post.blog = @blog
    end
    after do
      @blog.verify
    end
    it "adds the post to the blog" do
      @blog.expect :add_entry, nil, [post] 
      post.publish
    end
  end
end
    