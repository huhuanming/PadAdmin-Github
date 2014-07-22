class CompanyPlugin < ActiveRecord::Base
	belongs_to :company
	belongs_to :plugin
end
