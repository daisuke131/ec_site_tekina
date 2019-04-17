CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIARHONV3XJ4HSG62FA',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'rails-ecsite-tekina'
  config.cache_storage = :fog
end