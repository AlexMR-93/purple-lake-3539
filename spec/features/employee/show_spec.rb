require "rails_helper"


RSpec.describe("Employee Show page") do
  before(:each) do
    @department1 = Department.create!(    name: "dept1",     floor: "first")
    @department2 = Department.create!(    name: "dept2",     floor: "second")
    @employee1 = Employee.create!(    name: "alex",     level: 1,     department_id: @department1.id)
    @employee2 = Employee.create!(    name: "Gabe",     level: 2,     department_id: @department1.id)
    @employee3 = Employee.create!(    name: "Peyton",     level: 3,     department_id: @department2.id)
    @ticket1 = Ticket.create!(    subject: "art",     age: 21,     open: true)
    @ticket2 = Ticket.create!(    subject: "band",     age: 23,     open: true)
    @tickemp1 = Ticketemployee.create!(    ticket_id: @ticket1.id,     employee_id: @employee1.id)
    @tickemp2 = Ticketemployee.create!(    ticket_id: @ticket2.id,     employee_id: @employee1.id)
  end

  it("I see the employee's name and department name,") do
    visit(employee_path(@employee1.id))
    expect(page).to(have_content("Employee name:#{@employee1.name}"))
    expect(page).to(have_content("Employee Dept:#{@department1.name}"))
  end

  it("I see a list of the employee's tickets including the ticket subject and age,") do
    visit(employee_path(@employee1.id))
    expect(page).to(have_content("Employee ticket:#{@ticket1.subject}"))
    expect(page).to(have_content("Admission age:#{@ticket1.age}"))
  end

  it(" I see that this list is ordered from oldest to youngest,only includes open tickets") do
    visit(employee_path(@employee1.id))
    expect("#{@ticket2.age}").to(appear_before("#{@ticket1.age}"))
  end

  describe("story3") do
    it("I do not see any open tickets listed that are not assigned to the employee") do
      visit(employee_path(@employee1.id))
    end

    it("I fill in the form with the id of an open ticket that already exists in the database,Click Submit") do
      visit(employee_path(@employee1.id))
      click_button("Add tickect to #{@employee.name}")
      expect(current_path).to(eq(employee_ticket_path(@employee1.id, @ticket1.id)))
    end

    it("I am redirected back to that employee's show page,I see the ticket's subject now listed") do
    end
  end
end
