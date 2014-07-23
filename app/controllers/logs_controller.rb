class LogsController < ApplicationController
	def index
		@logs = current_admin_user.company.logs.order(created_at: :desc)
	end
end
