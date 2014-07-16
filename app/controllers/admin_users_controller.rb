class AdminUsersController < ApplicationController
	before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /admin_users
  # GET /admin_users.json
  def index
  	@admins = current_admin_user.company.admin_users
  end

  # GET /admin_users/1
  # GET /admin_users/1.json
  def show
  end

  # GET /admin_users/new
  def new
  	@admin = AdminUser.new
        @actionUrl = admins_path
  end

  # GET /admin_users/1/edit
  def edit
  end

  # POST /admin_users
  # POST /admin_users.json
  def create
  	@admin = AdminUser.new(admin_params)
  	@admin.company_id = current_admin_user.company.id

  	respond_to do |format|
  		if @admin.save
  			format.html { redirect_to admin_path(@admin), notice: '新建成功！' }
  			format.json { render :show, status: :created, location: @admin }
  		else
  			format.html { render :new}
  			format.json { render json: @admin.errors, status: :unprocessable_entity }
  		end
  	end
  end

  # PATCH/PUT /admin_users/1
  # PATCH/PUT /admin_users/1.json
  def update
  	respond_to do |format|
  		if @admin.update(admin_params)
  			format.html { redirect_to admin_path(@admin), notice: '编辑成功！' }
  			format.json { render :show, status: :ok, location: @admin }
  		else
  			format.html { render :edit }
  			format.json { render json: @admin.errors, status: :unprocessable_entity }
  		end
  	end
  end

  # DELETE /admin_users/1
  # DELETE /admin_users/1.json
  def destroy
  	@admin.destroy
  	respond_to do |format|
  		format.html { redirect_to admins_url, notice: '删除成功！' }
  		format.json { head :no_content }
  	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
    	@admin = AdminUser.find(params[:id])
    	if @admin.nil? || ( @admin.company_id != current_admin_user.company.id )
    		redirect_to admins_path  
    	end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
    	params.require(:admin_user).permit(:username, :email, :password, :password_confirmation)
    end
  end

