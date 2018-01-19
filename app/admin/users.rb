ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  # This determines which attributes of the User model will be
  # displayed in the index page. I have left only username, but
  # feel free to uncomment the rest of the fields or add any
  # other of the User attributes.
  
  index do
  selectable_column
  column :username
  column :email
  column :password
  column :password_confirmation
  column :role_ids
  actions
  end
  #--------------------------------------------------------------------
    permit_params :username, :email, :password, :password_confirmation, role_ids: []
    form do |f|
    f.inputs "User Details" do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles, as: :check_boxes
    end
    f.actions
  end
  # Allow form to be submitted without a password
  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete "password"
        params[:user].delete "password_confirmation"
      end
      super
    end
  end

end