module ProductDecorator
  def item_price
    "¥#{kanma(price)}円(税込)"
  end

  def kanma(price)
    price.to_s(:delimited)
  end
end
