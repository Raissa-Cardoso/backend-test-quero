class AddColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :enrollments, :student_id, :integer
    add_column :bills, :enrollment_id, :integer
  end
end
