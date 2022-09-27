require "rails_helper"


RSpec.describe(Ticket, type: :model) do
  describe("relationships") do
    it { should(have_many(:ticketemployees)) }
    it { should(have_many(:employees).through(:ticketemployees)) }
  end

  describe("method model ") do
    it("can sort oldest to youngest ticket") do
      @ticket1 = Ticket.create!(      subject: "art",       age: 21,       open: true)
      @ticket2 = Ticket.create!(      subject: "band",       age: 23,       open: true)
      expect(Ticket.oldie_youngie).to(eq([@ticket2, @ticket1]))
    end
  end
end
