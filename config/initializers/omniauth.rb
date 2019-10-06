Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer unless Rails.env.production?
#   provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
# end

# 'GITHUB_KEY' is where you'll insert Client ID info, recieved after creating your Github OAuth app.

# 'GITHUB_SECRET' is the Client Secret info, recieved after creating your Github OAuth app.