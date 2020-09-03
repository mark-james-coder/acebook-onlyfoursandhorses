require 'rails_helper'

RSpec.feature 'post comments' do
  scenario 'deleting comments' do
    sign_up
    click_link 'Posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'Message text'
    click_button 'Submit'
    click_link 'Show'
    expect(page).to have_content('Message text')
    fill_in 'postcomment[content]', with: 'Commenting'
    click_button 'Add comment'
    expect(page).to have_content('Commenting')
    click_link('Delete comment')
    expect(page).not_to have_content('Commenting')
  end
end
