class SearchController < ApplicationController
  def index
    @q = Post.search(params[:q])
    @posts = @q.result
    @post_count = @posts.count
    @q = Group.search(params[:q])
    @groups = @q.result
    @group_count = @groups.count
  end
end