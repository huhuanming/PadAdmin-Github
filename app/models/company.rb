class Company < ActiveRecord::Base

has_many :admin_users
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

end
