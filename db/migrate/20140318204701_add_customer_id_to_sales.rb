class AddCustomerIdToSales < ActiveRecord::Migration
  def change
    add_column :sales, :customer_id, :integer

    Sale.reset_column_information
    Sale.find_each do |sale|
      customer = Customer.find_by(name: sale.customer_and_account_no.split[0])
      sale.customer_id = customer.id
      sale.save
    end
  end
end
