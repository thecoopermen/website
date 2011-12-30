ActiveAdmin.register Author do
  index do
    column :name
    column 'Twitter Username', :twitter
    column :updated_at
    column :created_at
    default_actions
  end

  show :title => :name do
    attributes_table do
      row :name
      row('Twitter Username') { author.twitter }
      row :bio
      row :updated_at
      row :created_at
    end
  end
end
