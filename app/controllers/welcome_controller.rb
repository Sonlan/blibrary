class WelcomeController < ApplicationController
  layout false
  
  def index
    render file: 'welcome/xx.js', content_type: "application/javascript"
  end

  def login
  end
end
