class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.integer :amount
      t.date :due_date
      t.string :status

      t.timestamps
    end
  end
end
