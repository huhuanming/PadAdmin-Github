class AddBirefToInforms < ActiveRecord::Migration
   def change
  	 add_column :informs, :brief, :string
  end
end
