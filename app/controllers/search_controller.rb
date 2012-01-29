class SearchController < ApplicationController
  def index
    @q = Post.search(params[:q])
    @posts = @q.result
    @q = Group.search(params[:q])
    @groups = @q.result
  end
end