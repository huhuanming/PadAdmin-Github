class PushTarget < ActiveRecord::Base

	belongs_to :push_message
	validates :pad_id, presence: true
	validates :push_message_id, presence: true

end
