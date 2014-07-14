class AddIndexToPadMacAddress < ActiveRecord::Migration
  def change
  	add_index :pads, :Mac_address, unique: true
  end
end
