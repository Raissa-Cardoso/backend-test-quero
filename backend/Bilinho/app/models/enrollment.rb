class Enrollment < ApplicationRecord
    validates :amount, :installments, :due_day, presence: true
    validates :amount, numericality: {greater_than:0}
    validates :installments, numericality: {greater_than:1}
    validates :due_day, inclusion: {in: 1...32}  
    belongs_to :student
    has_many :bills, :dependent => :destroy
   
end
