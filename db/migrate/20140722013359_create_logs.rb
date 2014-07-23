class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :admin_user_id
      t.integer :company_id
      t.string :event
      t.string :description

      t.timestamps
    end
  end
end
