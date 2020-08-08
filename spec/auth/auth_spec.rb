require 'rails_helper'

# rspec spec/views/user_spec.rb
RSpec.describe 'Main flow', type: :system do
  describe 'New user' do
    it 'Logs in, creates post and logout' do
      visit('/users/sign_up')
      # Sign up User1
      fill_in('user[username]', with: 'Test')
      fill_in('user[fullname]', with: 'Test full')
      fill_in('user[email]', with: 'test@mail.com')
      fill_in('user[password]', with: 'password')
      fill_in('user[password_confirmation]', with: 'password')
      click_button('Sign up')
      click_link('Logout')

      # Sign up User2
      visit('/users/sign_up')
      fill_in('user[username]', with: 'Test2')
      fill_in('user[fullname]', with: 'full name2')
      fill_in('user[email]', with: 'test2@mail.com')
      fill_in('user[password]', with: 'password')
      fill_in('user[password_confirmation]', with: 'password')
      click_button('Sign up')
    end
  end
end
