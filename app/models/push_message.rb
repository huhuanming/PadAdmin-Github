class PushMessage < ActiveRecord::Base

belongs_to :company
has_many :push_targets

end
