class SessionsController < ApplicationController
  def login
    #raise request.env["omniauth.auth"].to_yaml
    auth = request.env['omniauth.auth']
    user = Twi.find_by_provider_and_uid(auth["provider"], auth["uid"])

    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => 'login'
    else
      redirect_to root_url, :notice => "id is missing"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_url, :notice => 'logout'
  end

  def create
    auth = request.env["omniauth.auth"]
    user = Twi.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
      Twi.create_with_omniauth(auth)

    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Log out"
  end
end
