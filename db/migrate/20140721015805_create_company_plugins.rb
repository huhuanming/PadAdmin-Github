class CreateCompanyPlugins < ActiveRecord::Migration
  def change
    create_table :company_plugins do |t|
    	t.integer :company_id
    	t.integer :plugin_id
    	
      t.timestamps
    end
  end
end
