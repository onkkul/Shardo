class SessionsController < ApplicationController
  skip_before_filter :can_proceed
  
  class DoubleLoginError < ArgumentError ; end
  class NotCurrentUserError < ArgumentError ; end
    
  def new
    
    
  end
  
  def auth_hash
    #@auth_hash ||= request.env['omniauth.env'] 
    @auth_hash ||= request.env['omniauth.auth'] 
    
  end
  
  
  
  def create
    puts 'params'
    p params
    puts '1'
    begin
    #User is already signed in
      if session?
        if same_as_logged_in_user? auth_hash['info']
          raise DoubleLoginError, 
            "You may not login if you are already logged in"
        else
          raise NotCurrentUserError,
            "Identity Violation- Access Denied!"
        end
      
      else #login or signup
        puts '2'
        p auth_hash
        #User has alreasy registered and is logged in with same provider
        if Authorization.exists?(auth_hash)#User alreasy registered w/pro
          puts '6'
          auth=Authorization.find_with_omniauth(auth_hash)
          message="Welcome back #{auth.user.name}!"+ "You have logged in via #{auth.provider}"
        else
          puts "user exists"
          if User.exists?(auth_hash['info'])
            
            user=User.find_with_omniauth(auth_hash['info'])
            auth=user.add_provider(auth_hash)
            message="You can now login using #{auth_hash["provider"].captilize}"
          else #User is registering with given provider
            puts 'Should go here'
            p auth_hash['info']
            
            user = User.create_with_omniauth(auth_hash['info'])#! :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"] 
            auth=user.authorizations.create_with_omniauth(auth_hash)
            message = "Welcome #{user.name}! You have signed up via #{auth.provider}"
          end
        end
       puts '3'
       #create current_user and session
       session[:user_id] = auth.user.id
       self.current_user = auth.user
       flash[:notice] = "#{message}"
       redirect_to dashboard_index_path and return 
      end
    rescue DoubleLoginError,NotCurrentUserError, Exception => exception
         flash[:error]="#{exception.class}: #{exception.message}"
         redirect_to dashboard_index_path and return
    end
  end

  def failure
    begin
    rescue Exception => exception
       flash[:error] = "#{exception.class}: #{exception.message}"
       redirect_to welcome_login_path
    end
  end

  def destroy
    puts '4'
    #render :text => "logged out"
    message = "#{self.current_user.name} has logged out"
    self.current_user = nil
    session.delete(:user_id)
    reset_session
    flash[:notice] = message
    redirect_to welcome_login_path
  end
  
  def session?
    puts '5'
    !!session[:user_id]
  end
  
  def same_as_logged_in_user? info
    puts '6'
    user = User.find(session[:user_id])
    user.name ==info['name'] && user.email == info['email']
  end
  
  
  
  def cleanup
    reset_session
    flash[:warning]= "session reset"
    redirect_to welcome_login_path
    
  end
end
