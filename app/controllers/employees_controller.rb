class EmployeesController < ApplicationController
  def index
    @joins = Employee.joins(sales: [:product, :customer])
    @employees = @joins.distinct
  end

  def show
    @employee = Employee.find(params[:id])
    @sales = @employee.sales.order(sale_amount: :desc)
  end
end
