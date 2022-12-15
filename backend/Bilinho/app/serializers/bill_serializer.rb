class BillSerializer < ActiveModel::Serializer
  attributes :id, :due_date, :status, :amount, :enrollment_id
end
