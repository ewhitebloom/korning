class SalesController < ApplicationController
  def index
    @all_sales = Sale.joins(:unit_price).all
    @sales = @all_sales.where(sale_date:('10-1-2012')..('12-31-2012'))
  end

  def show
    @sale = Sale.find(params[:id])
  end

end
