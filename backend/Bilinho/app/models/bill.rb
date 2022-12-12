class Bill < ApplicationRecord

    STATUS=["open", "pending", "paid", "Open", "Pending", "Paid"]

    validates :amount, :due_date, :status, presence: true
    validates :amount, numericality: {greater_than:0}
    validates :status, inclusion: {in:STATUS}
    belongs_to :enrollment
 end
