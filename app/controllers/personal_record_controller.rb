class PersonalRecordController < ApplicationController
  before_action :check_role
  def search
    @user_id = session[:user_id]
    @book_name = params[:book_name].nil? ? '' : params[:book_name]
    @status = params[:status].nil? ? '2' : params[:status]
    @borrow_records = if @status == '2'
                        BorrowRecord.where(user_id: @user_id)
                                    .where('book_name like ?',
                                           "%#{@book_name}%")
                                    .order(id: :desc)
                                    .page(params[:page])
                      else
                        BorrowRecord.where(user_id: @user_id, status: @status)
                                    .where('book_name like ?',
                                           "%#{@book_name}%")
                                    .order(id: :desc)
                                    .page(params[:page])
                      end
    render '/navbar/my_center'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def check_role
    user_id = session[:user_id]
    render '/navbar/login' unless user_id.present? &&
                                  session[:expires_at] > Time.current
  end
end
