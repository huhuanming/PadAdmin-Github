class Company < ActiveRecord::Base

has_many :admin_user
has_many :products
has_many :informs
<<<<<<< HEAD
has_many :push_messages
=======
has_many :pads
>>>>>>> 平板管理—PadModel

end
