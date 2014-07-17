require "helpers"

module API
	class Root < Grape::API
    prefix "api"
	format :json

   	get "uploadToken" do
   		authInfo = {             
                'scope'      =>      "motor",
                'deadline'  =>       Time.new.to_i+600,
              }
        present:token, Qiniu::Auth.generate_uptoken(authInfo)
   	end

  end
end