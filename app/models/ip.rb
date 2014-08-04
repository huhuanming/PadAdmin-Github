class Ip < ActiveRecord::Base

	validates_confirmation_of :user_name
	validates_presence_of :user_name
	validates_confirmation_of :IP_address
	validates_presence_of :IP_address
end
