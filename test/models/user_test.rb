require 'test_helper'
class UserTest < ActiveSupport::TestCase

  test 'create the user without exception' do
    assert_nothing_raised StandardError do
      User.create!(user_name: 'slanf',
                   password:  'ssss',
                   password_confirmation: 'ssss',
                   mail: 'test@email.com',
                   permission: 1)
    end
  end
end
