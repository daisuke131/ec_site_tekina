class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all.order(created_at: :desc)
  end
end
