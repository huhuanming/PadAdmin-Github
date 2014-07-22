class PluginsController < ApplicationController
  before_action :set_plugin, only: [ :destroy]

  # GET /plugins
  # GET /plugins.json
  def index
    @plugins = Plugin.all
  end

  # GET /plugins/1
  # GET /plugins/1.json
  # def show
  # end

  # GET /plugins/new
  # def new
  #   @plugin = Plugin.new
  # end

  # GET /plugins/1/edit
  # def edit
  # end

  # POST /plugins
  # POST /plugins.json
  def create
    @company_plugin = CompanyPlugin.new(:company_id => current_admin_user.company.id, :plugin_id => params[:id])
    respond_to do |format|
      if @company_plugin.save
        @log = Log.create(:admin_user_id => current_admin_user.id, :company_id => current_admin_user.company.id, :event => "添加插件", :description => "#{current_admin_user.username}添加了名字为#{Plugin.find(@company_plugin.plugin_id).name}的插件")
        format.html { redirect_to plugins_path, notice: '插件添加成功！' }
      else
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /plugins/1
  # PATCH/PUT /plugins/1.json
  # def update
  #   respond_to do |format|
  #     if @plugin.update(plugin_params)
  #       format.html { redirect_to @plugin, notice: 'Plugin was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @plugin }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @plugin.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /plugins/1
  # DELETE /plugins/1.json
  def destroy
      @log = Log.create(:admin_user_id => current_admin_user.id, :company_id => current_admin_user.company.id, :event => "删除插件", :description => "#{current_admin_user.username}删除了名字为#{Plugin.find(@plugin.id).name}的插件")
    @plugin.company_plugin.find_by(company_id: current_admin_user.company.id).destroy
    respond_to do |format|
      format.html { redirect_to plugins_url, notice: '插件删除成功！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plugin
      @plugin = Plugin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plugin_params
      params[:plugin]
    end
  end
