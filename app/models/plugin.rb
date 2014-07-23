class Plugin < ActiveRecord::Base
	has_many :company_plugin, :dependent => :destroy
end
