require 'spec_helper'

describe Post do
  @attr = { 
    :name => "Example post",
  }
  it "should create a new post when new post is pushed" do
    Post.create!(@attr)
  end
  
end