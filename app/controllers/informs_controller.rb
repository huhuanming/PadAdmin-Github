class InformsController < ApplicationController
  before_action :set_inform, only: [:show, :edit, :update, :destroy]

  # GET /informs
  # GET /informs.json
  def index
    if params[:search].nil? || (!['title','author'].include? params[:type])
     @informs = current_admin_user.company.informs.page(params[:page])
   else
    @informs = current_admin_user.company.informs.where(params[:type]+' LIKE ?',"%#{params[:search]}%").page(params[:page])
  end
end

  # GET /informs/1
  # GET /informs/1.json
  def show

  end

  # GET /informs/new
  def new
    @inform = Inform.new
  end

  # GET /informs/1/edit
  def edit
  end

  # POST /informs
  # POST /informs.json
  def create
    @inform = Inform.new(inform_params)
    @inform.company_id = current_admin_user.company.id
    respond_to do |format|
      if @inform.save
        @log = Log.create(:admin_user_id => current_admin_user.id, :company_id => current_admin_user.company.id, :event => "新建新闻", :description => "#{current_admin_user.username}新建了标题为#{@inform.title}的新闻")
        format.html { redirect_to @inform, notice: '创建成功!' }
        format.json { render :show, status: :created, location: @inform }
      else
        format.html { render :new }
        format.json { render json: @inform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /informs/1
  # PATCH/PUT /informs/1.json
  def update
    @tmp = Inform.new(:title => @inform.title)
    respond_to do |format|
      if @inform.update(inform_params)
        @log = Log.create(:admin_user_id => current_admin_user.id, :company_id => current_admin_user.company.id, :event => "编辑新闻", :description => "#{current_admin_user.username}将标题#{@tmp.title}更新为#{@inform.title}")
        format.html { redirect_to @inform, notice: '更新成功!' }
        format.json { render :show, status: :ok, location: @inform }
      else
        format.html { render :edit }
        format.json { render json: @inform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /informs/1
  # DELETE /informs/1.json
  def destroy
   @log = Log.create(:admin_user_id => current_admin_user.id, :company_id => current_admin_user.company.id, :event => "删除新闻", :description => "#{current_admin_user.username}删除了标题为#{@inform.title}的新闻")
   @inform.destroy
   respond_to do |format|
    format.html { redirect_to informs_url, notice: '删除成功!' }
    format.json { head :no_content }
  end
end

  # POST /inform/destroy_ids
  # POST /inform/destroy_ids.json
  def destroy_ids
    params[:ids].split(",").each do | id |
      inform = Inform.find_by_id(id)
      if !inform.nil? && (inform.company_id == current_admin_user.company_id)
        inform.destroy
      end
    end
    respond_to do |format|
      format.html { redirect_to products_url, notice: '成功删除产品信息！' }
      format.json { render json: params, status: :ok }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inform
      @inform = Inform.find_by_id(params[:id]) 
      if @inform.nil? || ( @inform.company_id != current_admin_user.company.id )
        redirect_to informs_path  
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inform_params
      params.require(:inform).permit(:company_id, :title, :brief ,:author, :context)
    end
  end
