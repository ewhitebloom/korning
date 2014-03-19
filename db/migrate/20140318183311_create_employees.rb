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
      Employee.find_or_create_by(first: sale.employee.split[0], last: sale.employee.split[1], email: sale.employee.split[2])
    end
  end

  end
end
