require "rails_helper"
# expect rails version > 5.1
RSpec.describe "Widget management", :type => :system do
  it "enables me to create widgets" do
    visit "/navbar/to_login"

    fill_in "user_name", :with => "slanf.song"
    fill_in "password", :with => "123456"
    click_button "btn-sign-in"

    expect(page).to have_text("书籍检索")
  end
end
