class PostsController < ApplicationController
  caches_page :index, :show

  def index
    @posts = Post.where(:published => true).order('published_at DESC')
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end

  def show
    @post = Post.where(:published => true).find(params[:id])
  end
end
