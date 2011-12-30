ActiveAdmin.register Post do
  index do
    column :title
    column :subtitle
    column :published_at
    default_actions
  end

  show :title => :title do
    attributes_table do
      row('Author') { link_to post.author.name, [ :admin, post.author ] }
      row :title
      row :subtitle
      row :content
      row :published_at
      row :updated_at
      row :created_at
    end
  end
end
