class User < ActiveRecord::Base
   has_many :authorizations
   has_many :posts
   validates :name, :email, :presence => true
   
   #save user info
   def self.create_with_omniauth info
      create!(name: info['name'], email: info['email'])
   end
   
   #is user registered?
   def self.exists? info
      !!(User.find_with_omniauth(info))
   end
   
   #recover user info
   def self.find_with_omniauth info
      User.find_by(name: info['name'], email: info['email'])
   end
   
   #create new authorizationsassociated with this user
   def add_provider auth_hash
      self.authorizations.create_with_omniauth auth
   end
   
   def get_user_info
      
   end
   
   
end
