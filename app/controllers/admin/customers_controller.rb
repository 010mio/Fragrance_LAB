class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @cutomer = Article.find(params[:id])
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    redirect_to '/admin/customers'
  end

end
