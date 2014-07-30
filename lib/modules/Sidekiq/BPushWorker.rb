	class BPushWorker
		include Sidekiq::Worker

		def perform(name, count)
    		AdminUser.create(username:name, password:"89898989", password_confirmation:"89898989", email:"nn@nn.com")
end
end