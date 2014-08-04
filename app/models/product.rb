class Product < ActiveRecord::Base
	belongs_to :company
	validates_confirmation_of :product_name
	validates_presence_of :product_name
	validates_confirmation_of :brief
	validates_presence_of :brief
end
