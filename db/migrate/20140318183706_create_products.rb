class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name

      t.timestamps
    end

  Sale.find_each do |sale|
       unless sale.product_name == nil
        unless Product.find_by(name:sale.product_name).exists?
          Product.create(name: sale.product_name)
          puts "Product #{sale.product_name} created!"
        else
          puts "Product #{sale.product_name} already existed!"
        end
       end
    end
  end
end
