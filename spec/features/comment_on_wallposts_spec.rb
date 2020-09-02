require 'rails_helper'

RSpec.feature 'comments - wallposts' do
  scenario 'user can add comments on wallposts and delete them' do
    sign_up
    click_link 'Log out'
    sign_up_another_account
    visit '/users/1'
    fill_in 'wallpost[content]', with: 'Hi, Test!'
    click_button 'Submit'
    fill_in 'wallpostcomment[content]', with: 'Test Comment'
    click_button 'Add comment'
    expect(page).to have_content 'Player 2 Test Comment'
    all(:link, :text => 'Delete')[1].click
    expect(page).to_not have_content 'Player 2 Test Comment'
  end
end
