class AddNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :students, :name, false
    change_column_null :students, :cpf, false
    change_column_null :students, :payment_method, false
    change_column_null :enrollments, :amount, false
    change_column_null :enrollments, :installments, false
    change_column_null :enrollments, :due_day, false
    change_column_null :bills, :amount, false
    change_column_null :bills, :due_date, false
    change_column_null :bills, :status, false
  end
end
