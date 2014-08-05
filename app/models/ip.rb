class Ip < ActiveRecord::Base

	validates_confirmation_of :user_name
	validates_presence_of :user_name
	validates_confirmation_of :IP_address
	validates_presence_of :IP_address

	validates :IP_address, uniqueness: { case_sensitive: false }, 
	format: { with: /((?:(?:25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d)))\.){3}(?:25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d))))/, message: '不合法!'}
end
