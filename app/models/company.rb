class Company < ActiveRecord::Base

has_many :admin_user
has_many :products
has_many :informs

end
