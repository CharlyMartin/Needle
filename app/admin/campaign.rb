ActiveAdmin.register Campaign do


  permit_params :title, :batch_size, :duration, :date_start, :date_end, :description, :spec, :price, :category, :gender, :cat, photos: []


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


end
