class Post
  attr_accessor :blog, :title, :body

  def initialize(attrs={})
    attrs.each do |k, v|
      send("#{k}=", v)
    end
  end

  def publish
    blog.add_entry(self)
  end

  # the following was added initially to make the new form render 
  # if that is the only reason (might not stay the only reason)
  # should we not try to think harder how to keep this (imho hidden)
  # dependency out of this model?
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  def persisted?
    false
  end
end
