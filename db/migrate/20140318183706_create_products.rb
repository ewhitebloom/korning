class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name

      t.timestamps
    end

    Sale.all.each do |sale|
      unless Product.find_by(name: sale.product).exists?
        Product.create(name: sale.product_name)
        puts "Product #{sale.product_name} created!"
      else
        puts "Product #{sale.product_name} already existed!"
      end
    end

  end
end
