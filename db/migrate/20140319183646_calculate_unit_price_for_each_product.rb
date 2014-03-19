class CalculateUnitPriceForEachProduct < ActiveRecord::Migration
  def change
    add_column :products, :unit_price, :float

    Sale.reset_column_information
    Sale.find_each do |sale|
      customer = Customer.find_by(name: sale.customer_and_account_no.split[0])
      sale.customer_id = customer.id
      sale.save
    end
  end
end
