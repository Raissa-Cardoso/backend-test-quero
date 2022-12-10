class Bill < ApplicationRecord
    validates :amount, :due_date, :status, presence: true
    validates :amount, numericality: {greater_than:0}
    validates :status, inclusion: {in:["open", "pending", "paid", "Open", "Pending", "Paid"]}
    belongs_to :enrollment
    #verificar validação para due_date
end
