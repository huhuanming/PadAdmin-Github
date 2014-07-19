class AdminCompaniesController < ApplicationController
  before_action :set_admin_company, only: [:show, :edit, :update, :destroy]
  before_filter :check_role
  # GET /admin_companies
  # GET /admin_companies.json
  def index
    @admin_companies = Company.all
  end

  # GET /admin_companies/1
  # GET /admin_companies/1.json
  def show
  end

  # GET /admin_companies/new
  def new
    @admin_company = Company.new
    @admin = AdminUser.new
  end

  # GET /admin_companies/1/edit
  def edit
  end

  # POST /admin_companies
  # POST /admin_companies.json
  def create
    @admin_company = Company.new(admin_company_params)
    @admin = AdminUser.new(:username => @admin_company.username, :email => @admin_company.email, :password => @admin_company.password, :password_confirmation => @admin_company.password_confirmation)
    respond_to do |format|
      if @admin_company.save && @admin.save
        @admin.company_id = @admin_company.id
        @admin.save
        @admin.add_role :admin
        format.html { redirect_to admin_company_path(@admin_company), notice: '新建成功！' }
        format.json { render :show, status: :created, location: @admin_company }
      else
        format.html { render :new }
        format.json { render json: @admin_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_companies/1
  # PATCH/PUT /admin_companies/1.json
  def update
    respond_to do |format|
      if @admin_company.update(admin_company_params)
        format.html { redirect_to admin_company_path(@admin_company), notice: '编辑成功！' }
        format.json { render :show, status: :ok, location: @admin_company }
      else
        format.html { render :edit }
        format.json { render json: @admin_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_companies/1
  # DELETE /admin_companies/1.json
  def destroy
    @admin_company.destroy
    respond_to do |format|
      format.html { redirect_to admin_companies_url, notice: '删除成功！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_company
      @admin_company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_company_params
      params.require(:company).permit(:company_name, :company_address, :company_tel, :username, :email, :password, :password_confirmation)
    end

    def check_role
      if !current_admin_user.has_role? :root_admin
        redirect_to root_path
      end
    end
  end