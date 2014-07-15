class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = current_admin_user.company.products.page(params[:page])

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
    @product.company_id = current_admin_user.company.id
    respond_to do |format|
      if @product.save
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
    respond_to do |format|
      if @product.update(product_params)
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
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: '成功删除产品信息！' }
      format.json { head :no_content }
    end
  end 

  # POST /products/destroy_ids
  # POST /products/destroy_ids.json
  def destroy_ids
    Product.destroy(params[:ids].split(","))
    respond_to do |format|
      format.html { redirect_to products_url, notice: '成功删除产品信息！' }
      format.json { render json: params, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
      if @product.nil? || ( @product.company_id != current_admin_user.company.id )
          redirect_to informs_path  
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_id, :product_name, :context, :created_at, :updated_at)
    end
end

    def self.search(search, page)
      paginate :per_page => 5, :page => page,
               :conditions => ['name like ?', "%#{search}%"], :order => 'name'
    end