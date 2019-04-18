CarrierWave.configure do |config|
  config.fog_provider = "fog/aws"
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["SECRET_ACCESS_KEY"],
    region: "us-west-2",
  }
  config.fog_directory = "ec-tekina"
  config.fog_public = false
end
