class RenameMacAddressOfPads < ActiveRecord::Migration
  def change
  	rename_column :pads, :MAC_address, :Mac_address
  end
end
