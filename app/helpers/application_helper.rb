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

	def plugin_was_added?
		CompanyPlugin.find_by(company_id: current_admin_user.company.id, plugin_id: 1)	
	end
end
