class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.references :booking, null: false, foreign_key: true
      t.float :price
      t.integer :status

      t.timestamps
    end
  end
end
