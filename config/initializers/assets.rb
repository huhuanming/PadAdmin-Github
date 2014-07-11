Rails.application.config.assets.precompile += ["home.css"]
Rails.application.config.assets.precompile += %w( sessions.css )
Rails.application.config.assets.precompile += %w( companies.css )
Rails.application.config.assets.precompile += %w( informs.css )
Rails.application.config.assets.precompile += %w( products.css )
Rails.application.config.assets.precompile += %w( push_messages.css )


Rails.application.config.assets.precompile += %w( plugins/ueditor/ueditor.config.js )
Rails.application.config.assets.precompile += %w( plugins/ueditor/ueditor.all.min.js )
Rails.application.config.assets.precompile += %w( plugins/ueditor/ueditor.js )

