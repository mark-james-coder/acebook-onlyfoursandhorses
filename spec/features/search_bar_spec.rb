require 'rails_helper'

RSpec.feature 'search bar' do
  scenario 'it can search and direct to another users wall' do
    sign_up
    click_link 'Log out'
    sign_up_another_account
    fill_in 'search', with: 'Test Johnson'
    click_button 'search_user'
    expect(page).to have_content "Test Johnson's Wall"
  end
  scenario "can't search blank name" do
    sign_up
    click_link 'Log out'
    sign_up_another_account
    fill_in 'search', with: ''
    click_button 'search_user'
    expect(page).to have_content 'User not found'
  end
  scenario "can't search invalid name" do
    sign_up
    click_link 'Log out'
    sign_up_another_account
    fill_in 'search', with: 'imaginary friend'
    click_button 'search_user'
    expect(page).to have_content 'User not found'
  end
end
