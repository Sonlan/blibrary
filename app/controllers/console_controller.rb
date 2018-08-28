class ConsoleController < ApplicationController
  before_action :check_role

  def book_type_delete
    @book_type = BookType.find(params[:id])
    respond_to do |format|
      if @book_type.update!(status: BookType::DELETE_STATUS)
        format.js { @status = 0 }
      else
        format.js { @status = 1 }
      end
    end
  end

  def books_manage
    @book_types = BookType.where(status: BookType::READY_STATUS)
                          .where('book_name like ? ', "%#{params[:book_name]}%")
                          .order(id: :desc).page(params[:page])
  end

  def borrow_records_manage
    @borrow_records = ConsoleService.borrow_records_manage(params[:book_name],
                                                           params[:status],
                                                           params[:page])
  end

  def users_manage; end

  def add_book
    Book.create!(book_type_id: params[:book_type_id],
                 serial_code: params[:serial_code],
                 status: Book::READY,
                 borrow_times: 0,
                 create_time: Time.now)
    redirect_to "/console/book_type_detail?id=#{params[:book_type_id]}"
  end

  def remove_book
    book = Book.find_by(id: params[:id])
    book.destroy
    redirect_to "/console/book_type_detail?id=#{params[:book_type_id]}"
  end

  def add_book_type; end

  def create_book_type
    uploader = AvatarUploader.new
    uploader.store!(params[:img])
    byebug
    paths = uploader.thumb.url.split('upload_file')
    img_path = "/upload_file#{paths.last}"
    # path = uploader.retrieve_from_store!(uploader.filename)
    BookType.create!(book_name: params[:book_name],
                     introduction: params[:introduction],
                     catalog: params[:catalog],
                     status: BookType::READY_STATUS,
                     # img_paths: "/upload_file/#{uploader.filename}")
                     img_paths: img_path
                   )
    redirect_to '/console/books_manage'
  end

  def book_type_detail
    @book_type = BookType.find_by(id: params[:id])
    @books = Book.where(book_type_id: params[:id])
                 .order(:id)
                 .page(params[:page])
  end

  def push
    code = ConsoleService.push(session[:user_id], params[:id])
    @id = params[:id]
    respond_to do |format|
      if code == CallCode::SUCCESS
        format.js { @status = 0 }
      else format.js { @status = 1 }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def check_role
    user_id = session[:user_id]
    redirect_to '/auth/bauth' unless user_id.present? &&
                                  user_id == 1 &&
                                  session[:expires_at] > Time.current
  end
end
