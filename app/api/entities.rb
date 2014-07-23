module API
	module APIEntities
		 class Informs < Grape::Entity
      		expose :id, :title, :author, :created_at, :updated_at, :brief
    	end


		 class Inform < Grape::Entity
      		expose :id, :title, :author, :context, :created_at, :updated_at
    	end
	end
end