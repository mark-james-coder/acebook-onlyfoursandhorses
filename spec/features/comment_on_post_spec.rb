require 'rails_helper'

RSpec.feature 'Comments - posts' do
  scenario 'user can add comments on posts' do
    sign_up
    click_link 'See Posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Submit'
    first(:link, 'Show').click
    fill_in 'postcomment[content]', with: 'Hello to you too!'
    click_button 'Add comment'
    expect(page).to have_content('Hello to you too!')
  end
  scenario 'user can delete comments on posts' do
    sign_up
    click_link 'See Posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Submit'
    first(:link, 'Show').click
    fill_in 'postcomment[content]', with: 'Hello to you too!'
    click_button 'Add comment'
    expect(page).to have_content 'Hello to you too!'
    all(:link, :text => 'Delete')[1].click
    expect(page).to_not have_content('Hello to you too!')
  end
end
