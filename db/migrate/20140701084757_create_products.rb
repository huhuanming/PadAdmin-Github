class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :company_id
      t.string :product_name
      t.text :context

      t.timestamps
    end
  end
end
