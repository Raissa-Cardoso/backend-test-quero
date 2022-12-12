class Student < ApplicationRecord

    PAYMENT_METHOD=["credit_card", "boleto", "Credit_card", "Boleto"]
    CPF_NUMBERS=11

    validates :name, :cpf, :payment_method, presence: true
    validates :cpf, length: {is:CPF_NUMBERS}
    validates :payment_method, inclusion: {in: PAYMENT_METHOD}
    validates_uniqueness_of :cpf
    has_many :enrollments    
end
