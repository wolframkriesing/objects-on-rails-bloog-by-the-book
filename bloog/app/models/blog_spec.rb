require "minitest/autorun"
require_relative "./blog"
describe Blog do
  before do
    @it = Blog.new
  end
  it "has no entries" do
    @it.entries.must_be_empty
  end
end