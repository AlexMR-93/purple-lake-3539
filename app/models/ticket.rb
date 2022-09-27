class Ticket < ApplicationRecord
  validates_presence_of :subject, :age, :open
  has_many :ticketemployees
  has_many :employees,   through: :ticketemployees

  def self.oldie_youngie
    Ticket.where(    open: true).order(    age: :desc)
  end
end
