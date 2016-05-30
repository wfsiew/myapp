class AdminController < ApplicationController

  before_filter :authenticate, except: [:new, :callback]

  def new
    uri = 'http://localhost:8000/google/callback/'
    @url = ['https://accounts.google.com/o/oauth2/auth',
            '?response_type=code',
            '&client_id=579168859503.apps.googleusercontent.com',
            "&redirect_uri=#{uri}",
            '&scope=openid%20profile%20email',
            '&login_hint=email',
            '&approval_prompt=force'] * ''
    render
  end

  def callback
    code = params[:code]
    url = 'https://accounts.google.com/o/oauth2/token'
    k = {
      code: code,
      client_id: '579168859503.apps.googleusercontent.com',
      client_secret: 'G-WYqCt2UGYZRKq3V4o10wli',
      redirect_uri: 'http://localhost:8000/google/callback/',
      grant_type: 'authorization_code'
    }
    s = AdminHelper.post url, k
    d = AdminHelper.tojson s

    url = 'https://www.googleapis.com/oauth2/v1/userinfo'
    k = {
      'access_token': d['access_token']
    }
    s = AdminHelper.get url, k
    m = AdminHelper.tojson s
    
    session[:user_id] = m['email']
    session['google_user'] = m

    redirect_to admin_index_path
  end

  def destroy
    reset_session
    redirect_to admin_login_path
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= session[:user_id]
  end

  def authenticate
    logged_in? ? true : access_denied
  end

  def logged_in?
    current_user.present?
  end

  def access_denied
    redirect_to admin_login_path, :notice => 'Please log in to continue' and return false
  end

end
