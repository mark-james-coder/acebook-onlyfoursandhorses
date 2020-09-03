require 'rails_helper'

RSpec.feature 'post likes' do
  scenario 'you can like a post' do
    sign_up
    click_link 'Posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to_not have_content '0 likes'
    click_button 'Like'
    expect(page).to have_content '1 like'
    click_button 'Like'
    expect(page).to have_content '2 likes'
  end
  scenario 'you can like a wallpost' do
    sign_up
    fill_in 'wallpost[content]', with: 'Hi, Test!'
    click_button 'Submit'
    expect(page).to_not have_content '0 likes'
    click_button 'Like'
    expect(page).to have_content '1 like'
    click_button 'Like'
    expect(page).to have_content '2 likes'
  end
end
