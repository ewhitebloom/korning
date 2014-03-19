class AddEmployeeIdToSales < ActiveRecord::Migration
  def change
    add_column :sales, :employee_id, :integer

    Sale.reset_column_information
    Sale.find_each do |sale|
      if sale.employee != nil
        employee = Employee.find_by(last: sale.employee.split[1])
        sale.employee_id = employee.id
        sale.save
      end
    end
  end
end
