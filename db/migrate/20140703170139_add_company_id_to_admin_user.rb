class AddCompanyIdToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :company_id, :integer
    remove_column :companies, :admin_user_id
  end
end
