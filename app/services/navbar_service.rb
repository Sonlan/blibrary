# to response to nacbar html request
class NavbarService
  # login code
  def self.login(user_name, password)
    # select the user to confirm whether the user exists
    user = User.find_by(user_name: user_name)
    return CallCode::SUCCESS, user.id if user && user.authenticate(password)
    # return the result
    [CallCode::FAIL, 0]
  end

  # siup logic
  def self.signup(user_name, password, email)
    begin
      return CallCode::SUCCESS if User.create!(user_name: user_name,
                                               password:  password,
                                               password_confirmation: password,
                                               mail: email,
                                               permission: User::USER)
    rescue StandardError => e
      p e.to_s
      return CallCode::EXCEPTION
    end
    CallCode::FAIL
  end

  def self.messages(user_id, page)
    @messages = if user_id.present?
                  Message.where(user_id: user_id)
                         .order(:id)
                         .page(page)
                else
                  Message.none
                end
  end

  def self.msg_delete(msg_id)
    @message = Message.find_by(id: msg_id)
    return CallCode.SUCCESS if @message.destroy
    CallCode.FAIL
  end
end
