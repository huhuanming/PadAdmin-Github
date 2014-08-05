class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.string :user_name
      t.string :IP_address

      t.timestamps
    end
  end
end
