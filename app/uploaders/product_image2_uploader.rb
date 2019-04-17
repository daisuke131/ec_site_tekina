class ProductImage2Uploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end

  # jpgにコンバート
  process convert: "jpg"

  # 保存ディレクトリ名
  def store_dir
    "product_images/#{model.id}"
  end

  # nilの時この画像を表示する
  def default_url
    "/product_images/default_item_image.jpg"
  end

  # デフォルト画像リサイズ
  process resize_to_limit: [700, 700]

  # サムネイル画像リサイズ
  version :thumb do
    process resize_to_fill: [100, 100]
  end

  # 許可する画像の拡張子
  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  # 保存するファイル名
  def filename
    "puroduct2.jpg" if original_filename
  end
end
