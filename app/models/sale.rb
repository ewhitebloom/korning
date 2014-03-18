class Sale < ActiveRecord::Base
  has_one :product, :customer, :employee
end
