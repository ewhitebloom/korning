class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :account
      t.string :website

      t.timestamps
    end

  Sale.find_each do |sale|
    if sale.customer_and_account_no != nil
      unless Customer.find_by( account: sale.customer_and_account_no.split[1]).exists?
        name = sale.customer_and_account_no.split[0]
        account = sale.customer_and_account_no.split[1]
        Customer.create(name: name, account: account)
        puts "Customer #{sale.customer_and_account_no} created!"
      else
        puts "Customer #{sale.customer_and_account_no} already exists!"
      end
    end
   end
  end

end
