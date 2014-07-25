class BaiduPushPadId < ActiveRecord::Migration
  def change
  	change_column :baidu_pushes, :pad_id, :integer
  end
end
