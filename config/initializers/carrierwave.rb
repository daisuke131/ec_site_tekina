require "carrierwave/storage/abstract"
require "carrierwave/storage/file"
require "carrierwave/storage/fog"

CarrierWave.configure do |config|
  config.fog_provider = "fog/aws"
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "AKIARHONV3XJ4HSG62FA",
    aws_secret_access_key: "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",
    region: "us-west-2",
  }
  config.fog_directory = "rails-ecsite-tekina"
  config.fog_public = false
end
