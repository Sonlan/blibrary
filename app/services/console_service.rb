class ConsoleService
  def self.borrow_records_manage(book_name, status, page)
    book_name, status = params_prepare(book_name, status)
    return search_by_book_name(book_name, page) if status == Book::ALL.to_s
    search_by_status_name(status, book_name, page)
  end

  def self.params_prepare(book_name, status)
    book_name = book_name.nil? ? '' : book_name
    status = status.nil? ? Book::ALL.to_s : status
    [book_name, status]
  end

  def self.search_by_book_name(book_name, page)
    BorrowRecord.where(' book_name like ?',
                       "%#{book_name}%")
                .order(id: :desc)
                .page(page)
  end

  def self.search_by_status_name(status, book_name, page)
    BorrowRecord.where(status: status)
                .where('book_name like ?',
                       "%#{book_name}%")
                .order(id: :desc)
                .page(page)
  end

  def self.push(user_id, record_id)
    borrow_record = BorrowRecord.find_by(id: record_id)
    begin
      return CallCode::SUCCESS if Message.create!(
        user_id: borrow_record.user_id,
        msg_type: Message::ADMIN_NOTICE,
        title: Message::BOOK_EXPIR_REMINDER,
        content: Message.book_expir_content(borrow_record.book_name),
        sender_id: user_id,
        create_time: Time.now
      )
    rescue StandardException
      return CallCode::Exception
    end
    CallCode::FAIL
  end
end
