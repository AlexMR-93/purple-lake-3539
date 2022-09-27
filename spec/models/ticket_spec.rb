require "rails_helper"


RSpec.describe(Ticket, type: :model) do
  describe("relationships") do
    it { should(have_many(:ticketemployees)) }
    it { should(have_many(:employees).through(:ticketemployees)) }
  end
end
