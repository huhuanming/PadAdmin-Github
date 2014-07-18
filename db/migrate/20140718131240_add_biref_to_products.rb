class AddBirefToProducts < ActiveRecord::Migration
  def change
  	 add_column :products, :brief, :string
  end
end
