require 'rails_helper'
RSpec.feature 'Wall Posts' do
  scenario 'can post on someones wall' do 
    sign_up 
    click_link('Log out')
    sign_up_another_account
    visit '/users/1'
    expect(page).to have_content 'Add a wallpost:'
    fill_in 'wallpost[content]', with: 'Hi, Test!'
    click_button 'Submit'
    expect(page).to have_content 'Player 2 Hi, Test!'
  end
  scenario 'poster can delete their post' do
    sign_up 
    click_link('Log out')
    sign_up_another_account
    visit '/users/1'
    expect(page).to have_content 'Add a wallpost:'
    fill_in 'wallpost[content]', with: 'Hi, Test!'
    click_button 'Submit'
    click_link 'Delete'
    expect(page).to_not have_content 'Player 2 Hi, Test!'
  end
end
