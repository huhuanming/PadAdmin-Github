class CreatePadUsers < ActiveRecord::Migration
  def change
    create_table :pad_users do |t|
      t.string :name

      t.timestamps
    end
  end
end
