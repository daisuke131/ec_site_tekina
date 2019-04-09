class UsersController < ApplicationController
  before_action :authenticate_user!
  PER = 10

  def show
    @products = current_user.products.where(sold_flg: false).page(params[:page]).per(PER)
  end

  def favorites
    @products = current_user.favorite_products.page(params[:page]).per(PER)
  end

  def buys
    @products = current_user.sold_products.page(params[:page]).per(PER)
  end

  def solds
    @products = current_user.products.where(sold_flg: true).page(params[:page]).per(PER)
  end
end
