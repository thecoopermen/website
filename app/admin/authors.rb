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
      row('Guest?') { author.guest ? 'Yes' : 'No' }
      row :icon_url
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :twitter, :label => 'Twitter Username'
      f.input :bio
      f.input :guest
      f.input :icon_url, :input_html => { :disabled => true }
    end
    f.buttons
  end
end
