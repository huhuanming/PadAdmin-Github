class CreatePlugins < ActiveRecord::Migration
  def change
    create_table :plugins do |t|
      t.string :name
      t.string :brief
      t.string :icon

      t.timestamps
    end
  end
end
