module Authenticate
  extend ActiveSupport::Concern

  def sign_in(user)
    session[:status] = CallCode::SUCCESS
    session[:user_id] = user.id
    session[:expires_at] = Time.current + 15.minutes
  end

  def sign_out
    reset_session
  end
end
