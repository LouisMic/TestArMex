class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :adress
      t.string :postal_code
      t.string :country
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
