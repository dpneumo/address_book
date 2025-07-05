class AddStatusToPeople < ActiveRecord::Migration[8.0]
  def change
    add_column :people, :status, :string, default: 'uncontacted', null: false
    add_index :people, :status
  end
end
