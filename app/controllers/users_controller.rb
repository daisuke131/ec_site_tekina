class UsersController < ApplicationController
  def show
    @products = Product.joins(:user).select("products.*, users.name as user_name")
    @producter = @products.first
    @product = Product.left_joins(:user).select("products.*, users.id as user_id, users.name as user_name").where(products: { id: 52 }).first
    # binding.pry
  end
end
