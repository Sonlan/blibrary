class NavbarController < ApplicationController
  before_action :check_role, only: %i[messages msg_delete]
  # 个人中心跳转页
  def my_center
    if session[:status] == CallCode::SUCCESS
      redirect_to '/personal_record/search'
    else
      render 'login'
    end
  end

  def to_login
    render 'login'
  end

  def logout
    sign_out
    redirect_to Rails.configuration.setting[:gcac][:get_logout_api]
  end

  # 登录逻辑
  def login
    code, id = NavbarService.login(params[:user_name], params[:password])
    case code
    when CallCode::SUCCESS
      session[:status] = CallCode::SUCCESS
      session[:user_id] = id
      session[:expires_at] = Time.current + 15.minutes
      redirect_to '/book_types'
    else
      render 'login'
    end
  end

  # 返回注册页面
  def register
    p 'register'
  end

  def signup
    code = NavbarService.signup(params[:user_name],
                                params[:password],
                                params[:email])
    respond_to do |format|
      case code
      when CallCode::SUCCESS
        format.js { @status = 0 }
      else
        format.js { @status = 1 }
      end
    end
  end

  def messages
    user_id = session[:user_id]
    @messages = NavbarService.messages(user_id, params[:page])
  end

  def msg_delete
    @message = Message.find_by(id: params[:id])
    respond_to do |format|
      if @message.destroy
        format.js {}
        format.json { render json: @message }
      else
        format.json { render json: @message.errors }
      end
    end
  end

  private

  def check_role
    user_id = session[:user_id]
    render '/navbar/login' unless user_id.present? &&
                                  session[:expires_at] > Time.current
  end
end
