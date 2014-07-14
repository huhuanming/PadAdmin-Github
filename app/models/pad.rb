class Pad < ActiveRecord::Base
	belongs_to :company
	validates :Mac_address,  presence: true, uniqueness: { case_sensitive: false }, length: { is: 17}
end
