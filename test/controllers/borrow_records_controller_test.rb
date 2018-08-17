require 'test_helper'

class BorrowRecordsControllerTest < ActionController::TestCase
  setup do
    @borrow_record = borrow_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:borrow_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create borrow_record" do
    assert_difference('BorrowRecord.count') do
      post :create, borrow_record: { book_id: @borrow_record.book_id, book_name: @borrow_record.book_name, borrow_time: @borrow_record.borrow_time, serial_code: @borrow_record.serial_code, status: @borrow_record.status, time_limit: @borrow_record.time_limit, user_id: @borrow_record.user_id }
    end

    assert_redirected_to borrow_record_path(assigns(:borrow_record))
  end

  test "should show borrow_record" do
    get :show, id: @borrow_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @borrow_record
    assert_response :success
  end

  test "should update borrow_record" do
    patch :update, id: @borrow_record, borrow_record: { book_id: @borrow_record.book_id, book_name: @borrow_record.book_name, borrow_time: @borrow_record.borrow_time, serial_code: @borrow_record.serial_code, status: @borrow_record.status, time_limit: @borrow_record.time_limit, user_id: @borrow_record.user_id }
    assert_redirected_to borrow_record_path(assigns(:borrow_record))
  end

  test "should destroy borrow_record" do
    assert_difference('BorrowRecord.count', -1) do
      delete :destroy, id: @borrow_record
    end

    assert_redirected_to borrow_records_path
  end
end
