class AuthsController < ApplicationController
  def callback
    auth_hash = request.env['omniauth.auth']
    user = User.find_by(user_name: auth_hash[:info][:name])
    if user.nil?
      passwd = 'default'
      user = User.create!(user_name: auth_hash[:info][:name],
                          password:  passwd,
                          password_confirmation: passwd,
                          mail: auth_hash[:info][:email],
                          permission: User::USER)
    end
    sign_in(user)
    redirect_to root_path
  end
end
