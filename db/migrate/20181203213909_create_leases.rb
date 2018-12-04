class CreateLeases < ActiveRecord::Migration[5.2]
  def change
    create_table :leases do |t|
      t.datetime :start_date
      t.datetime :exp_date
      t.string :tenant_name
      
      t.timestamps
    end
  end
end
