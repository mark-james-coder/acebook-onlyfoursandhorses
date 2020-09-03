require 'rails_helper'
RSpec.feature 'Wall Posts' do
  before(:each) do
    sign_up
    click_link('Log out')
    sign_up_another_account
    visit '/users/1'
    expect(page).to have_content 'Add a wallpost:'
    fill_in 'wallpost[content]', with: 'Hi, Test!'
    click_button 'Submit'
  end

  scenario 'can post on someones wall' do
    expect(page).to have_content 'Player 2'
    expect(page).to have_content 'Hi, Test!'
    expect(page).to have_content 'less than a minute'
  end
  scenario 'poster can delete their post' do
    click_link 'Delete'
    expect(page).to_not have_content 'Player 2'
    expect(page).to_not have_content 'Hi, Test!'
  end
  scenario 'poster can update their post' do
    click_link 'Edit'
    fill_in 'wallpost[content]', with: 'Updated Test!'
    click_button 'Update Wallpost'
    expect(page).to have_content 'Player 2'
    expect(page).to have_content 'Updated Test!'
    expect(page).to_not have_content 'Hi, Test!'
  end
end
