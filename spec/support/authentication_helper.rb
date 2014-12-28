require 'spec_helper'


module AuthenticationHelper
  def sign_in_as(user)
    visit new_user_session_path
    fill_in('user[email]', with: 'anewemail@gmail.com')
    fill_in('user[password]', :with => 'superspy')
    click_on "Log in"
  end
end
