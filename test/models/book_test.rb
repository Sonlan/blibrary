require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'create book' do
    assert_nothing_raised StandardError do
      BookType.create!(book_type_id: books(:one).book_type_id,
                       serial_code: books(:one).serial_code,
                       status: books(:one).status,
                       borrow_times: books(:one).borrow_times,
                       create_time: books(:one).create_time)
    end
    assert_nothing_raised StandardError do
      BookType.create!(book_type_id: books(:two).book_type_id,
                       serial_code: books(:two).serial_code,
                       status: books(:two).status,
                       borrow_times: books(:two).borrow_times,
                       create_time: books(:two).create_time)
    end
  end
end
