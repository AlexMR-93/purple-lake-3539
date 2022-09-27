class Ticket < ApplicationRecord
  validates_presence_of :subject, :age, :open
  has_many :ticketemployees
  has_many :employees,   through: :ticketemployees
end
