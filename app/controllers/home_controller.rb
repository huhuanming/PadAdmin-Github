class HomeController < ApplicationController

	def index
		if !current_admin_user.company_id?
			current_admin_user.company_id = Company.create.id
			current_admin_user.save
  		end
	end
end
