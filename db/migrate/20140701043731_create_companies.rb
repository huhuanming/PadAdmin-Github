class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :admin_user_id
      t.string :company_name
      t.string :company_address
      t.string :company_tel

      t.timestamps
    end
  end
end
