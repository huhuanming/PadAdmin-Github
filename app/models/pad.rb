class Pad < ActiveRecord::Base
	has_one :pad_user
	belongs_to :company
	validates :Mac_address, :presence => { :message => "不能为空字符" }, uniqueness: { case_sensitive: false }, 
	format: { with: /([a-zA-Z]|\d){2}:([a-zA-Z]|\d){2}:([a-zA-Z]|\d){2}:([a-zA-Z]|\d){2}:([a-zA-Z]|\d){2}:([a-zA-Z]|\d){2}/, message: '格式为XX:XX:XX:XX:XX:XX'}

	attr_accessor :pad_user_name

	def save
		if !super
			return false
		end
		PadUser.create(:name => self.pad_user_name, :pad_id => self.id)
	end

	def update(pad_params)
		if !super(pad_params)
			return false
		end
		user = self.pad_user
		user.update(:name => self.pad_user_name)
	end
end
