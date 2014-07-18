class AddpadIdTopadUsers < ActiveRecord::Migration
  def change
  	 add_column :pad_users, :pad_id, :integer
  end
end
	