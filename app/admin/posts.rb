ActiveAdmin.register Post do
  index do
    column :title
    column :subtitle
    column :published_at
    default_actions
  end

  show :title => :title do
    attributes_table do
      row('Author') { link_to post.author.name, admin_author_path(post.author) }
      row :title
      row :subtitle
      row :permalink
      row :published_at
      row :updated_at
      row :created_at
      row('content') { content_tag :pre, post.content }
    end
  end

  form partial: 'form'
end
