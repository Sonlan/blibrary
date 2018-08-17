require 'rails_helper'

RSpec.describe User, type: :model do
  it 'create user with exception' do
    expect do
      User.create!
    end.to raise_error(StandardError)
  end
end
describe 'Test user create' do
  it 'create user without exception' do
    user = User.create!(user_name: 'slanf',
                        password:  'ssss',
                        password_confirmation: 'ssss',
                        mail: 'test@email.com',
                        permission: 1)
    expect(user).to be_an_instance_of(User)
  end
end
