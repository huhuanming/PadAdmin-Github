class PadsController < ApplicationController
  before_action :set_pad, only: [:show, :edit, :update, :destroy]

  # GET /pads
  # GET /pads.json
  def index
    @pads = current_admin_user.company.pads
  end

  # GET /pads/1
  # GET /pads/1.json
  def show
  end

  # GET /pads/new
  def new
    @pad = Pad.new
  end

  # GET /pads/1/edit
  def edit
  end

  # POST /pads
  # POST /pads.json
  def create
    @pad = Pad.new(pad_params)
    @pad.company_id = current_admin_user.company.id

    respond_to do |format|
      if @pad.save
        @log = Log.create(:admin_user_id => current_admin_user.id, :company_id => current_admin_user.company.id, :event => "新建平板", :description => "#{current_admin_user.username}新建了MAC地址为#{@pad.Mac_address}的平板")
        format.html { redirect_to @pad, notice: '新建成功！' }
        format.json { render :show, status: :created, location: @pad }
      else
        format.html { render :new}
        format.json { render json: @pad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pads/1
  # PATCH/PUT /pads/1.json
  def update
      @tmp = Pad.new(:Mac_address => @pad.Mac_address)
    respond_to do |format|
      if @pad.update(pad_params)
       @log = Log.create(:admin_user_id => current_admin_user.id, :company_id => current_admin_user.company.id, :event => "编辑平板", :description => "#{current_admin_user.username}将MAC地址#{@tmp.Mac_address}更新为#{@pad.Mac_address}")
       format.html { redirect_to @pad, notice: '编辑成功！' }
       format.json { render :show, status: :ok, location: @pad }
     else
      format.html { render :edit }
      format.json { render json: @pad.errors, status: :unprocessable_entity }
    end
  end
end

  # DELETE /pads/1
  # DELETE /pads/1.json
  def destroy
    @log = Log.create(:admin_user_id => current_admin_user.id, :company_id => current_admin_user.company.id, :event => "删除平板", :description => "#{current_admin_user.username}删除了MAC地址为#{@pad.Mac_address}的平板")
    @pad.destroy
    respond_to do |format|
      format.html { redirect_to pads_url, notice: '删除成功！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pad
      @pad = Pad.find(params[:id])
      if  @pad.nil? || (@pad.company_id != current_admin_user.company.id )
        redirect_to pads_path  
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pad_params
      params.require(:pad).permit(:Mac_address, :company_id, :pad_user_name)
    end

  end
