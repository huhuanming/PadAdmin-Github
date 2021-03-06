class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @company = current_admin_user.company
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    
  end

  # GET /companies/new
  # def new
  #   @company = Company.new
  # end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  # def create
  #   @company = Company.new(company_params)

  #   respond_to do |format|
  #     if @company.save
  #       format.html { redirect_to @company, notice: 'Company was successfully created.' }
  #       format.json { render :show, status: :created, location: @company }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @company.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        @log = Log.create(:admin_user_id => current_admin_user.id, :company_id => current_admin_user.company.id, :event => "更新公司信息", :description => "#{current_admin_user.username}更新了公司信息")
        format.html { redirect_to companies_path, notice: '公司信息更新成功！' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  # def destroy
  #   @company.destroy
  #   respond_to do |format|
  #     format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = current_admin_user.company
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:company_name, :company_address, :company_tel)
    end
end
