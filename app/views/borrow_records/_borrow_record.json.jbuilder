json.extract! borrow_record, :id, :user_id, :book_id, :borrow_time, :time_limit, :status, :book_name, :serial_code, :created_at, :updated_at
json.url borrow_record_url(borrow_record, format: :json)
