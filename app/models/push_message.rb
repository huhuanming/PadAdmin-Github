class PushMessage < ActiveRecord::Base

belongs_to :company
has_many :push_targets
validates :message, presence: true, length: { minimum: 1 }, length: { maximum: 80 }

end
