class EmployeesController < ApplicationController
  def index
    @employees = Employee.joins(sales: :product, sales: :customer)
  end

  def show
    @employee = Employee.find(params[:id])
  end
end
