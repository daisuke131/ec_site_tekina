FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    favorites_count { Faker::Number.within(0..5) }
    price { Faker::Number.within(1000..100000) }
    image1 { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/testimage/test.jpg")) }
    image2 { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/testimage/test.jpg")) }
    image3 { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/testimage/test.jpg")) }
    sold_flg { Faker::Number.within(0..1) }
  end
end
