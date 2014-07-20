class PushMessagesController < ApplicationController
  before_action :set_push_message, only: [:show, :edit, :update, :destroy]

  # GET /push_messages
  # GET /push_messages.json
  def index
    @push_messages = current_admin_user.company.push_messages
  end

  # GET /push_messages/1
  # GET /push_messages/1.json
  def show
  end

  # GET /push_messages/new
  def new
    @push_message = PushMessage.new
    @pad = current_admin_user.company.pads
  end

  # GET /push_messages/1/edit
  def edit
  end

  # POST /push_messages
  # POST /push_messages.json
  def create
    @push_message = PushMessage.new(push_message_params)
    @push_message.company_id = current_admin_user.company.id

    respond_to do |format|
      if @push_message.save
        params[:ids].split(",").each do | id |
          PushTarget.create(pad_id: id, push_message_id: @push_message.id);
        end
        
        format.html { redirect_to @push_message, notice: '推送消息创建成功' }
        format.json { render :show, status: :created, location: @push_message }
      else
        format.html { render :new }
        format.json { render json: @push_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /push_messages/1
  # PATCH/PUT /push_messages/1.json
  def update
    respond_to do |format|
      if @push_message.update(push_message_params)
        format.html { redirect_to @push_message, notice: '推送消息修改成功' }
        format.json { render :show, status: :ok, location: @push_message }
      else
        format.html { render :edit }
        format.json { render json: @push_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /push_messages/1
  # DELETE /push_messages/1.json
  def destroy
    @push_message.destroy
    respond_to do |format|
      format.html { redirect_to push_messages_url, notice: '推送消息删除成功' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_push_message
      @push_message = PushMessage.find(params[:id])
      if @push_message.nil? || ( @push_message.company_id != current_admin_user.company.id )
        redirect_to push_messages_path  
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def push_message_params
      params.require(:push_message).permit(:message)
    end
  end
