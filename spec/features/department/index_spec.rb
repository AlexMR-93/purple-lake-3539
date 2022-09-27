require "rails_helper"


RSpec.describe("Department Index page") do
  before(:each) do
    @department1 = Department.create!(    name: "dept1",     floor: "first")
    @department2 = Department.create!(    name: "dept2",     floor: "second")
    @employee1 = Employee.create!(    name: "alex",     level: 1,     department_id: @department1.id)
    @employee2 = Employee.create!(    name: "Gabe",     level: 2,     department_id: @department1.id)
    @employee3 = Employee.create!(    name: "Peyton",     level: 3,     department_id: @department2.id)
  end

  it("I see each department's name and floor") do
    visit(departments_path)
    expect(page).to(have_content("Dept name:#{@department1.name}"))
    expect(page).to(have_content("Dept name:#{@department2.name}"))
    expect(page).to(have_content("Dept floor:#{@department1.floor}"))
    expect(page).to(have_content("Dept floor:#{@department2.floor}"))
  end

  it("  And underneath each department, I can see the names of all of its employees") do
    visit(departments_path)
    expect(page).to(have_content("Dept name:#{@department1.name}"))
    expect(page).to(have_content("Dept name:#{@department2.name}"))
    expect(page).to(have_content("Employee name:#{@employee1.name}"))
    expect(page).to(have_content("Employee name:#{@employee3.name}"))
  end
end
