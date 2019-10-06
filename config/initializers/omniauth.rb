Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, '66d7eb70d3fde6219efa', 'f94d612375c6cdb3d9272efd411b5913661eeb3f'
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer unless Rails.env.production?
#   provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
# end

# 'GITHUB_KEY' is where you'll insert Client ID info, recieved after creating your Github OAuth app.

# 'GITHUB_SECRET' is the Client Secret info, recieved after creating your Github OAuth app.