require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'has none to begin with' do
    expect(Book.count).to eq 0
  end

  it 'has one after adding one' do
    Book.create!
    expect(Book.count).to eq 1
  end

  it 'has none after one was created in a previous example' do
    expect(Book.count).to eq 0
  end
end
