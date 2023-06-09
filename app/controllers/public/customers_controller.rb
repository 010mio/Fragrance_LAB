class Public::CustomersController < ApplicationController
  before_action :ensure_normal_customer, only: %i[update edit]

  def show
  @customer = current_customer
  @articles = @customer.articles
  end

  def edit
  @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer.id)
    else
      render :edit
    end
  end

  def favorites
    @customer = Customer.find(params[:id])
    favorites = Favorite.where(customer_id: @customer.id).pluck(:article_id)
    @favorite_articles = Article.find(favorites)
  end

private

  def customer_params
    params.require(:customer).permit(:name, :profile_image)
  end
end
