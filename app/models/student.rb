class Student < ApplicationRecord
    validates :name, :cpf, :payment_method, presence: true
    validates :cpf, length: {is:11}
    validates :payment_method, inclusion: {in:["credit_card", "boleto", "Credit_card", "Boleto"]}
    validates_uniqueness_of :cpf
    has_many :enrollments
    #verificar validação para birthdate
end
