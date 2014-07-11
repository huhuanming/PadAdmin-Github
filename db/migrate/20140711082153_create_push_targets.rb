class CreatePushTargets < ActiveRecord::Migration
  def change
    create_table :push_targets do |t|
      t.integer :push_message_id
      t.integer :pad_id

      t.timestamps
    end
  end
end
