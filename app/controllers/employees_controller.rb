class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    @sales = Employee.joins(:sales)
  end

  def show
    @employee = Employee.find(params[:id])
  end
end
