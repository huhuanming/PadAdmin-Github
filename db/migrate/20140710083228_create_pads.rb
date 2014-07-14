class CreatePads < ActiveRecord::Migration
	def change
		create_table :pads do |t|
			t.string :MAC_address

			t.timestamps
		end
	end
end
