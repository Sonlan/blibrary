require 'rails_helper'

RSpec.describe 'Navbars', type: :request do
  describe 'GET / ' do
    it 'should get index page' do
      # get navbars_path
      # expect(response).to have_http_status(200)
      get '/'
      expect(response.status).to eq(200)
    end
  end

  describe 'get /book_types' do
    it 'should get index page' do
      get '/book_types'
      expect(response.status).to eq(200)
    end
  end

  describe 'get /book_types/search' do
    it 'should get a page of target book' do
      get '/book_types',
          params: { book_name: 'MyString', page: 1 }
      expect(response.body).to include('MyString')
    end
  end

  describe 'get /navbar/to_login' do
    it 'should get login page' do
      get '/navbar/to_login'
      expect(response.body).to include('Sign in to BookMS')
    end
  end

  describe 'post /navbar/login' do
    it 'should set session and return to /book_types' do
      post '/navbar/login',
           params: { user_name: 'slanf.song', password: '123456' }
      expect(response).to render_template('login')
    end
  end
end
