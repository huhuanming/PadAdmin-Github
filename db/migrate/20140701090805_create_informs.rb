class CreateInforms < ActiveRecord::Migration
  def change
    create_table :informs do |t|
      t.integer :company_id
      t.string :title
      t.string :author
      t.text :context
      t.timestamps
    end
  end
end
