# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  PER = 18

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新登録用
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name image]) # 編集用
  end

  # ヘッダーの商品名検索
  def set_search
    @search = Product.ransack(params[:q])
    @products = @search.result.order(created_at: :desc).page(params[:page]).per(PER)
  end
end
