class CalculateUnitPriceForEachProduct < ActiveRecord::Migration
  def change
    add_column :products, :unit_price, :float

    Product.reset_column_information
    Sale.find_each do |sale|
      product = Product.find_by(id: sale.product_id)
     if product.unit_price == nil
      product.unit_price = (sale.sale_amount.to_f/sale.units_sold.to_f).round(2)
      product.save
     end
    end
  end
end
