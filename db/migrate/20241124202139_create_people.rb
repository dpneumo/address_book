class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :nickname
      t.integer :birthday
      t.integer :birthmonth
      t.integer :birthyear
      t.string :note

      t.timestamps
    end
  end
end
