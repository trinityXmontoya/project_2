Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_PROJECT_2_ID'], ENV['FACEBOOK_PROJECT_2_SECRET'],
    scope: 'basic_info'
end
