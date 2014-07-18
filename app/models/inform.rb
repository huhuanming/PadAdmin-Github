class Inform < ActiveRecord::Base
	belongs_to	:company

  validates_confirmation_of :title
  validates_presence_of :title
  validates_confirmation_of :author
  validates_presence_of :author
  validates_confirmation_of :brief
  validates_presence_of :brief

end
