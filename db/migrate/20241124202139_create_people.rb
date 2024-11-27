class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :addressee
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :note

      t.timestamps
    end
  end
end
