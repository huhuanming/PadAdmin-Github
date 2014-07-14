class PushMessageAddCompanyId < ActiveRecord::Migration
  def change
  	add_column :push_messages, :company_id, :integer
  end
end
