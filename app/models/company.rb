class Company < ActiveRecord::Base

has_many :admin_users
has_many :products
has_many :informs
has_many :push_messages
has_many :pads

end
