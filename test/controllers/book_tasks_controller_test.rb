require 'test_helper'

class BookTasksControllerTest < ActionController::TestCase
  test 'should get borrow' do
    get :borrow,
        { 'id' => 2 },
        'user_id' => 1, 'expires_at' => Time.current + 15.minutes
    assert_response :success
  end

  test 'should get return_book' do
    get :return_book,
        { 'id' => 1 },
        'user_id' => 1, 'expires_at' => Time.current + 15.minutes
    assert_response :success
  end
end
