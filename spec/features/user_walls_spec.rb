require 'rails_helper'
RSpec.feature 'User Walls' do
  scenario 'can visit someones wall and get back to our own' do
    sign_up
    click_link('Log out')
    sign_up_another_account
    visit '/users/test-johnson'
    expect(page).to have_content "Test Johnson's Wall"
    click_link 'Profile'
    expect(page).to have_content 'Your Wall'
  end
  scenario 'cannot edit or delete someones profile' do
    sign_up
    click_link('Log out')
    sign_up_another_account
    visit '/users/test-johnson'
    expect(page).to_not have_link 'Edit User'
    expect(page).to_not have_link 'Delete User'
  end
end
