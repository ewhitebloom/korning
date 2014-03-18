class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :account
      t.string :website

      t.timestamps
    end

    Sale.all.each do |sale|
      unless Customer.find_by(name: sale.customer).exists?
        Customer.create(name: sale.customer)
      end
    end
  end

end
