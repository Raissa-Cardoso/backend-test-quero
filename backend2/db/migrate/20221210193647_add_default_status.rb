class AddDefaultStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bills, :status, "open"
  end
end
