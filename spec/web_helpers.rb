# frozen_string_literal: true

def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'user[name]', with: 'Test Johnson'
  fill_in 'user[email]', with: 'testjohnson@testmail.com'
  fill_in 'user[password]', with: '123456'
  click_button 'Create User'
end

def sign_up_another_account
  click_link 'Sign up'
  fill_in 'user[name]', with: 'Player 2'
  fill_in 'user[email]', with: 'player2@testmail.com'
  fill_in 'user[password]', with: '123456'
  click_button 'Create User'
end
