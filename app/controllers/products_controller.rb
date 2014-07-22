class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if params[:search].nil?
      @products = current_admin_user.company.products.page(params[:page])
    else
      @products = current_admin_user.company.products.where('product_name LIKE ?',"%#{params[:search]}%").page(params[:page])
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end


  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.company_id = current_admin_user.company_id
    respond_to do |format|
      if @product.save
       @log = Log.create(:admin_user_id => current_admin_user.id, :company_id => current_admin_user.company.id, :event => "新建商品", :description => "#{current_admin_user.username}新建了名字为#{@product.product_name}的商品")
       format.html { redirect_to @product, notice: '成功添加商品信息！' }
       format.json { render :show, status: :created, location: @product }
     else
      format.html { render :new }
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
  end
end
  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json

  def update
    @tmp = Product.new(:product_name => @product.product_name)
    respond_to do |format|
      if @product.update(product_params)
        @log = Log.create(:admin_user_id => current_admin_user.id, :company_id => current_admin_user.company.id, :event => "编辑商品", :description => "#{current_admin_user.username}将名字#{@tmp.product_name}更新为#{@product.product_name}")
        format.html { redirect_to  @product, notice: '成功修改商品信息！' }
        format.json { render json: @product, :status => "ok"}
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @log = Log.create(:admin_user_id => current_admin_user.id, :company_id => current_admin_user.company.id, :event => "删除商品", :description => "#{current_admin_user.username}删除了名字为#{@product.product_name}的商品")
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: '成功删除产品信息！' }
      format.json { head :no_content }
    end
  end 

  # POST /products/destroy_ids
  # POST /products/destroy_ids.json
  def destroy_ids
    params[:ids].split(",").each do | id |
      product = Product.find_by_id(id)
      if !product.nil? && (product.company_id == current_admin_user.company_id)
        product.destroy
      end
    end

    respond_to do |format|
      format.html { redirect_to products_url, notice: '成功删除产品信息！' }
      format.json { render json: params, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
      if @product.nil? || ( @product.company_id != current_admin_user.company_id )
        redirect_to informs_path  
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_id, :product_name, :brief, :context, :created_at, :updated_at)
    end
  end

  def self.search(search, page)
    paginate :per_page => 5, :page => page,
    :conditions => ['name like ?', "%#{search}%"], :order => 'name'
  end

