class BookTasksController < ApplicationController
  before_action :check_role
  def borrow
    code = BookTaskService.borrow(params[:id], @user_id)
    @id = params[:id]
    respond_to do |format|
      if CallCode::SUCCESS == code
        format.js { @status = 0 }
      else
        format.js { @status = 1 }
      end
    end
  end

  def return_book
    code = BookTaskService.return_book(params[:id])
    @id = params[:id]
    respond_to do |format|
      if CallCode::SUCCESS == code
        format.js { @status = 0 }
      else
        format.js { @status = 1 }
      end
    end
  end

  private

  def check_role
    @user_id = session[:user_id]
    @forbidden = 0
    @forbidden = 1 unless @user_id.present? &&
                          session[:expires_at] > Time.current
  end
end
