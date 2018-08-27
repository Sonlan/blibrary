module ApplicationHelper
    def admin?
      session[:status].present? && session[:user_name] == 'slanf.song'
    end
end
