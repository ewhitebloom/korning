class CalculateUnitPriceForEachProduct < ActiveRecord::Migration
  def change
    add_column :products, :unit_price, :float

    Product.reset_column_information
    Sale.find_each do |sale|
      product = Product.find_by(id: sale.product_id)
     unless product.unit_price != nil
      sale.sale_amount / sale.units_sold = product.unit_price
      product.save
     end
    end
  end
end
