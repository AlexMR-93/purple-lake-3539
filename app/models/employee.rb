class Employee < ApplicationRecord
  validates_presence_of :name, :level
  belongs_to :department
  has_many :ticketemployees
  has_many :tickets,   through: :ticketemployees
end
