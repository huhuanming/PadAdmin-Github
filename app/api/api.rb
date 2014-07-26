require "entities"
require "helpers"

module API
	class Root < Grape::API
    prefix "api"
    format :json

    helpers APIHelpers

   # get Qiniu uploadToken
   get "uploadToken" do
     authInfo = {             
      'scope'      =>      "motor",
      'deadline'  =>       Time.new.to_i+600,
    }
    present:token, Qiniu::Auth.generate_uptoken(authInfo)
  end

    # inform resource 
    resource :informs do
      # Get informs list
      # params[:page]: default is 1
      # params[:per_page]: default is 10
      # Example
      #   /api/informs?page=1&per_page=15
      get do
        @informs = Inform.page(params[:page]).per(params[:per_page]||10)
        present @informs, with: APIEntities::Informs
      end

      # Get inform detail
      # Example
      #   /api/inform/1
      get ":id" do
        @inform = Inform.find_by_id(params[:id])
        error!("inform not found", 404) if @inform.blank?

        present @inform, with: APIEntities::Inform
      end
    end

    resource :products do
      # Get product list
      # params[:page]: default is 1
      # params[:per_page]: default is 10
      # Example
      #   /api/products?page=1&per_page=15
      get do
        @products = Product.page(params[:page]).per(params[:per_page]||10)
        present @products, with: APIEntities::Products
      end

      # Get product detail
      # Example
      #   /api/product/1
      get ":id" do
        @product = Product.find_by_id(params[:id])
        error!("product not found", 404) if @product.blank?
        present @product, with: APIEntities::Product
      end
    end

    #Create baidu_push detail
    #param[:channel_id]: can't be blank

    get 'chenhongshisb' do
      params do
        requires :channel_id, type: String
        requires :push_id, type: String
        requires :mac_address, type: String
      end
      pad = Pad.find_by(:Mac_address => params[:mac_address])
      error!("pad not found", 404) if pad.blank?
      @baidu_push = BaiduPush.new(
        :channel_id => params[:channel_id],
        :push_id => params[:push_id],
        :pad_id => pad.id)
      error!(@baidu_push.errors, 422) if !@baidu_push.save
      present:status, "true"
    end
  end
end