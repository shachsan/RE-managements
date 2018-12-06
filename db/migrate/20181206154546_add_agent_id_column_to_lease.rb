class AddAgentIdColumnToLease < ActiveRecord::Migration[5.2]
  def change
    add_column :leases, :agent_id, :integer
  end
end
