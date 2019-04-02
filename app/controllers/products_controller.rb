# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: '出品完了しました。'
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(params[:id]), notice: '商品情報を修正しました'
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path, notice: '出品をキャンセルしました。'
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image1, :image2, :image3).merge(user_id: current_user.id, category_id: 1)
  end
end
