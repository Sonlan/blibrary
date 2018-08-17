class BookTaskService
  def self.borrow(book_id, user_id)
    begin
      book, book_type, user, time = get_params(book_id, user_id)
      BorrowRecord.transaction do
        BorrowRecord.create!(user_id: user.id,
                             book_id: book.id,
                             borrow_time: time,
                             time_limit: (time + 30.day),
                             status: Book::BORROWING,
                             book_name: book_type.book_name,
                             serial_code: book.serial_code,
                             user_name: user.user_name)
        book.update!(status: Book::BORROWING,
                     borrow_times: book.borrow_times + 1)
      end
      return CallCode::SUCCESS
    rescue StandardError => e
      p e.to_s
      return CallCode::EXCEPTION
    end
    CallCode::FAIL
  end

  def self.get_params(book_id, user_id)
    book = Book.find_by(id: book_id)
    book_type = BookType.find_by(id: book.book_type_id)
    user = User.find_by(id: user_id)
    time = Time.now
    [book, book_type, user, time]
  end

  def self.return_book(record_id)
    @borrow_record = BorrowRecord.find_by(id: record_id)
    @book = Book.find_by(id: @borrow_record.book_id)
    begin
      Book.transaction do
        @book.update(status: Book::READY)
        @borrow_record.update(status: BorrowRecord::RETURNED)
      end
      return CallCode::SUCCESS
    rescue StandardError => e
      p e.to_s
      return CallCode::EXCEPTION
    end
    CallCode::FAIL
  end
end
