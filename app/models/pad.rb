class Pad < ActiveRecord::Base
	belongs_to :company
	validates :Mac_address, :presence => { :message => "不能为空字符" }, uniqueness: { case_sensitive: false }, 
							format: { with: /([a-zA-Z]|\d){2}:([a-zA-Z]|\d){2}:([a-zA-Z]|\d){2}:([a-zA-Z]|\d){2}:([a-zA-Z]|\d){2}:([a-zA-Z]|\d){2}/, message: '格式为XX:XX:XX:XX:XX:XX'}
end
