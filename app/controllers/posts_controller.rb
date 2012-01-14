class PostsController < ApplicationController
  caches_page :index, :show

  def index
    @posts = Post.where(:published => true).order('published_at DESC')
  end

  def show
    @post = Post.where(:published => true).find(params[:id])
  end
end
