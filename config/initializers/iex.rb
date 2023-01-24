IEX::Api.configure do |config|
  config.publishable_token = 'pk_2d40f5af3f6146e489e8f354b66462c6' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
  config.secret_token = 'sk_7d970aba51464a82befc6734f26f7193' # defaults to ENV['IEX_API_SECRET_TOKEN']
  config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end
