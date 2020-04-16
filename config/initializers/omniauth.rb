OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :developer if Rails.env.development?
 provider :github, '64adef049be87b51b16c', '33ee337f2e3931db40040b3d9b240280b5daa79a',
         {:name => "github", :scope => ['read:user', 'user:email' ]}
        
end
