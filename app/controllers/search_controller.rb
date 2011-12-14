class SearchController < ApplicationController
  def index
    @search = Post.search do
      fulltext params[:search]
    end
    @posts = @search.results
    @search = Group.search do
      fulltext params[:search]
    end
    @groups = @search.results
  end
end