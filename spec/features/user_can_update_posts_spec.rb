require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'updating posts' do
    sign_up
    click_link 'Posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'Testing'
    click_button 'Submit'
    first(:link, 'Show').click
    first(:link, 'Update').click
    fill_in 'post[message]', with: ''
    click_button 'Update Post'
    expect(page).to have_content "Message can't be blank"
    fill_in 'post[message]', with: 'Something else'
    click_button 'Update Post'
    expect(page).not_to have_content('Testing')
    expect(page).to have_content('Something else')
  end
end
