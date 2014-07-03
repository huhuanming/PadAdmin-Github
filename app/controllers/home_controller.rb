class HomeController < ApplicationController
	before_action :authenticate_admin_user!

	def index
		if !current_admin_user.company_id?
			current_admin_user.company_id = Company.create.id
			current_admin_user.save
  		end
	end
end
