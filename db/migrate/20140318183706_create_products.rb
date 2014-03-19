class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name

      t.timestamps
    end

  Sale.find_each do |sale|
       unless sale.product_name == nil
          unless Product.where(name:sale.product_name).any?
            Product.create(name: sale.product_name)
            puts "Product #{sale.product_name} created!"
          else
            puts "Product #{sale.product_name} already existed!"
          end
       end
    end
  end
end
