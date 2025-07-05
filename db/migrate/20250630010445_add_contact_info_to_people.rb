class AddContactInfoToPeople < ActiveRecord::Migration[8.0]
  def change
    add_column :people, :email, :string
    add_column :people, :phone, :string
    add_column :people, :pref_method, :string
    add_index :people, :pref_method
  end
end
