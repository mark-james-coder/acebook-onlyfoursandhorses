# frozen_string_literal: true

def sign_up
  visit '/'
  fill_in 'user[name]', with: 'Test Johnson'
  fill_in 'user[email]', with: 'testjohnson@testmail.com'
  fill_in 'user[password]', with: '123456'
  click_button 'Create User'
end

def sign_up_another_account
  fill_in 'user[name]', with: 'Player 2'
  fill_in 'user[email]', with: 'player2@testmail.com'
  fill_in 'user[password]', with: '123456'
  click_button 'Create User'
end

def post_on_someones_wall
  sign_up
  click_link('Log out')
  sign_up_another_account
  visit '/users/test-johnson'
  expect(page).to have_content 'Add a wallpost:'
  fill_in 'wallpost[content]', with: 'Hi, Test!'
  click_button 'Submit'
end
