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
  
#  def index
#   if params[:search].present?
#      @posts = Post.search(params[:query], load: => true)
#    else
##      @posts = Post.al
#    end
#  end
end