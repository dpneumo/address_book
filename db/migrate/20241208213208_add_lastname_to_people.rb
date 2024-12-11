class AddLastnameToPeople < ActiveRecord::Migration[8.0]
  def change
    add_column :people, :lastname, :string
  end
end
