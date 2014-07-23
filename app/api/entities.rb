module API
	module APIEntities
		 class Inform < Grape::Entity
      		expose :id, :title, :author, :context, :created_at, :updated_at, :brief
    	end
	end
end