class AdminInfosController < ApplicationController
	before_action :set_admin_user, only: [:show, :edit, :password, :update_password, :update]
	def show
	end

	def edit
	end

	def password
	end

	def update
		respond_to do |format|
			if  @admin.update(admin_params)
				@log = Log.create(:admin_user_id => current_admin_user.id, :company_id => current_admin_user.company.id, :event => "编辑管理员", :description => "#{current_admin_user.username}修改了个人信息")
				format.html { redirect_to "/admin_infos/#{@admin.id}", notice: '编辑成功！' }
				format.json { render :show, status: :ok, location: @admin }
			else
				format.html { render :edit }
				format.json { render json: @admin.errors, status: :unprocessable_entity }
			end
		end
	end

	def update_password
		respond_to do |format|
			if  @admin.update(admin_params) && @admin.valid_password?(params[:admin_user][:current_password])
				format.html { redirect_to root_path, notice: '编辑成功！' }
				format.json { render :show, status: :ok, location: @admin }
			else
				format.html { render :password }
				format.json { render json: @admin.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	def set_admin_user
		@admin = AdminUser.find(params[:id])
		if @admin.id != current_admin_user.id 
			redirect_to root_path  
		end
	end

	def admin_params
		params.require(:admin_user).permit(:username, :email, :password, :password_confirmation)
	end
end

