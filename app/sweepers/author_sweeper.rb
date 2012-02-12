class AuthorSweeper < ActionController::Caching::Sweeper
  observe AdminUser

  def after_save(author)
    # this is a hack because cache expiration is broken in sweepers triggered from activeadmin
    @controller ||= ActionController::Base.new

    # ActiveAdmin really does something to fuck with sweepers and so here is where I descend into
    # a hacky nightmare
    post_index = { controller: "/posts", action: "index", only_path: true }

    expire_page "/index"
    expire_page Rails.application.routes.url_helpers.url_for(post_index)

    Post.all.each do |post|
      post_show = { controller: "/posts", action: "show", id: post.to_param, only_path: true }
      expire_page Rails.application.routes.url_helpers.url_for(post_show)
    end
  end
end
