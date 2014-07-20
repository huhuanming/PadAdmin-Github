class Company < ActiveRecord::Base

	has_many :admin_users, :dependent => :destroy
	has_many :products
	has_many :informs
	has_many :push_messages
	has_many :pads

	validates_confirmation_of :company_name
	validates_presence_of :company_name
	validates_confirmation_of :company_address
	validates_presence_of :company_address
	validates_confirmation_of :company_tel
	validates_presence_of :company_tel

	attr_accessor :username, :email, :password, :password_confirmation

	# def save
	# 	if !super
	# 		return false
	# 	end
	# 	@admin = AdminUser.new(:username => self.username, :email => self.email, :password => self.password, :password_confirmation => self.password_confirmation, :company_id => self.id)
	# 	@admin.save
	# end
end
