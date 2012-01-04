class PreviewController < ApplicationController
  before_filter :authenticate_admin_user!

  def index
    @posts       = Post.order('published_at DESC')
    @path_helper = :preview_path
    render template: 'posts/index'
  end

  def show
    @post = Post.find(params[:id])
    render template: 'posts/show'
  end
end
