ActiveAdmin.register Post do
  index do
    column :title
    column :subtitle
    column :published_at
    default_actions
  end

  show :title => :title
end
