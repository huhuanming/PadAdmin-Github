module API
	module APIEntities
		 class Informs < Grape::Entity
      		expose :id, :title, :author, :updated_at, :brief
    	end


		 class Inform < Grape::Entity
      		expose :id, :title, :author, :context, :updated_at
    	end

    	class Products < Grape::Entity
    		expose :id, :product_name, :brief, :updated_at
    	end

    	class Product < Grape::Entity
    		expose :id, :product_name, :context, :updated_at
    	end
	end
end