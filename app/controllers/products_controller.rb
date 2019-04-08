# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: "出品完了しました。"
    else
      render "new"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(params[:id]), notice: "商品情報を修正しました"
    else
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path, notice: "出品をキャンセルしました。"
  end

  def charge
    @product = Product.find(params[:id])
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @product.price,
      description: "商品ID:#{@product.id} 商品名:#{@product.name}",
      currency: "jpy"
    )
    if @product.update(sold_flg: true) &&
      Sold.create(user_id: current_user.id, product_id: @product.id)
      redirect_to product_path(params[:id]), notice: "商品を購入しました！"
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :category_id, :description, :price, :image1, :image2, :image3).merge(user_id: current_user.id)
  end
end
