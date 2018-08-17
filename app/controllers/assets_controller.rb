class AssetsController < ApplicationController
  def show
    send_file "#{Rails.root}/upload_file/#{params[:filename]}.#{params[:format]}",
              type: 'image/jpeg', disposition: 'inline'
  end
end
