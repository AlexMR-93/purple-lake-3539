require "rails_helper"


RSpec.describe("Department Index page") do
  before(:each) do
    @department1 = Department.create!(    name: "dept1",     floor: "first")
    @department2 = Department.create!(    name: "dept2",     floor: "second")
  end

  it("I see each department's name and floor") do
    visit(departments_path)
    expect(page).to(have_content("Dept name:#{@department1.name}"))
    expect(page).to(have_content("Dept name:#{@department2.name}"))
    expect(page).to(have_content("Dept floor:#{@department1.floor}"))
    expect(page).to(have_content("Dept floor:#{@department2.floor}"))
  end

  it("  And underneath each department, I can see the names of all of its employees") do
  end
end
