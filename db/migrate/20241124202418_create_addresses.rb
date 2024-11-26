class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.references :person, null: false, foreign_key: true
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :preferred, default: true

      t.timestamps
    end
  end
end
