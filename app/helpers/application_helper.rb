module ApplicationHelper
  def resource_name
    :admin_user
  end
 
  def resource
    @resource ||= AdminUser.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:admin_user]
  end
end
