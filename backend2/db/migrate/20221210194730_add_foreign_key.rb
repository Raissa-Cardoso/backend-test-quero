class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :enrollments, :students, column: :student_id, primary_key: "id"
    add_foreign_key :bills, :enrollments, column: :enrollment_id, primary_key: "id"
  end
end
