 Rails.application.config.middleware.use OmniAuth::Builder do
   yammer = Rails.application.secrets.yammer
   provider :yammer, yammer.client_id, yammer.secret_token
 end
