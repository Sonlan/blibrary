json.extract! book, :id, :book_type_id, :serial_code, :status, :borrow_times, :create_time, :created_at, :updated_at
json.url book_url(book, format: :json)
