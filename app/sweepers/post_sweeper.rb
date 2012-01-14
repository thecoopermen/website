class PostSweeper < ActionController::Caching::Sweeper
  observe Post

  def after_save(post)
    # this is a hack because cache expiration is broken in sweepers triggered from activeadmin
    @controller ||= ActionController::Base.new

    # ActiveAdmin really does something to fuck with sweepers and so here is where I descend into
    # a hacky nightmare
    post_index = { controller: "/posts", action: "index", only_path: true }
    post_show  = { controller: "/posts", action: "show", id: post.to_param, only_path: true }

    expire_page "/index"
    expire_page Rails.application.routes.url_helpers.url_for(post_index)
    expire_page Rails.application.routes.url_helpers.url_for(post_show)
  end
end
