require "rails_helper"


RSpec.describe(Ticketemployee, type: :model) do
  describe("relationships") do
    it { should(belong_to(:ticket)) }
    it { should(belong_to(:employee)) }
  end
end
