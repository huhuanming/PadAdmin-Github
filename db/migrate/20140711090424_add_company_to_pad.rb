class AddCompanyToPad < ActiveRecord::Migration
  def change
  	add_column :pads, :company_id, :integer
  end
end
