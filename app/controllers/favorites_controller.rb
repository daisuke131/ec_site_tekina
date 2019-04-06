class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vialiables

  def favorite
    current_user.favorites.create(product_id: @product.id)
    @product.reload
  end

  def del_favorite
    @favorite = current_user.favorites.find_by(product_id: @product.id)
    @favorite.destroy
    @product.reload
  end

  private

  def set_vialiables
    @product = Product.find(params[:id])
    @id_name = "#favorite-#{@product.id}"
  end
end
