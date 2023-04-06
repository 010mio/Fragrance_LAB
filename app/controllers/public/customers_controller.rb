class Public::CustomersController < ApplicationController

    def show
    @customer = current_customer
    @articles = @customer.articles
    end

    def edit
    @customer = current_customer
    end

    def update
      @customer = current_customer
      @customer.update(customer_params)
      redirect_to customer_path(current_customer.id)
    end

private

  def customer_params
    params.require(:customer).permit(:name, :profile_image)
  end
end