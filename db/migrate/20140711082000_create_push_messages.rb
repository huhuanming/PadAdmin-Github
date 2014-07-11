class CreatePushMessages < ActiveRecord::Migration
  def change
    create_table :push_messages do |t|
      t.text :message

      t.timestamps
    end
  end
end
