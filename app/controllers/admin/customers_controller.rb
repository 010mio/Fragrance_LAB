class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @articles = @customer.articles
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    redirect_to '/admin/customers'
  end

end
