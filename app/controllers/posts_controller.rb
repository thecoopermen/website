class PostsController < ApplicationController

  def index
    @posts = Post.where(:published => true).order('published_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end
end
