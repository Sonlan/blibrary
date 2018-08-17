namespace :schedule_task do
  desc 'check expire borrow record'
  task send_expire_msg: :environment do
    check_expire_record
  end

  def check_expire_record
    puts 'lalla'
    borrow_records = BorrowRecord.where('DATEDIFF(time_limit,borrow_time) < 2')
    borrow_records.each do |borrow_record|
      send_message(borrow_record)
    end
  end

  def send_message(borrow_record)
    Message.create!(
      user_id: borrow_record.id,
      msg_type: Message::SYSTEM_NOTICE,
      title: Message::BOOK_EXPIR_REMINDER,
      content: Message.book_expir_content(borrow_record.book_name),
      sender_id: user_id,
      create_time: Time.now
    )
  end
end
