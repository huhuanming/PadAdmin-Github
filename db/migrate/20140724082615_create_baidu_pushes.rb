class CreateBaiduPushes < ActiveRecord::Migration
  def change
    create_table :baidu_pushes do |t|
      t.string :channel_id
      t.string :pad_id
      t.string :push_id
      t.timestamps
    end
  end
end
