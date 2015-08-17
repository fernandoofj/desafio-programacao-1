OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 
    '875526571272-hj9tcsrtj0tjuh1b927edeofhj1ic1iv.apps.googleusercontent.com', 
    'jWnn039KBeX26PQ_AVzAiwO1',
	{
		prompt: 'select_account',
		image_aspect_ratio: 'square',
		image_size: 200,
		client_options: {
			ssl: {
				ca_file: Rails.root.join("cacert.pem").to_s
			}
		}
	}
end