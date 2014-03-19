class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first
      t.string :last
      t.string :email

      t.timestamps
    end

  Sale.find_each do |sale|
    if sale.employee != nil
      unless Employee.where(last: sale.employee.split[0]).any?
        first = sale.employee.split[0]
        last = sale.employee.split[1]
        email = sale.employee.split[2]
        Employee.create(first: first, last: last, email: email)
        puts "Employee #{sale.employee} created!"
      else
        puts "Employee #{sale.employee} already exists!"
      end
    end
  end

  end
end
