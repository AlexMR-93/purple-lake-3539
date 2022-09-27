class CreateTicketemployee < ActiveRecord::Migration[5.2]
  def change
    create_table :ticketemployees do |t|
      t.references :ticket, foreign_key: true
      t.references :employee, foreign_key: true
    end
  end
end
