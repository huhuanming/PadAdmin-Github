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
        present @informs, with: APIEntities::Inform
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


  end
end