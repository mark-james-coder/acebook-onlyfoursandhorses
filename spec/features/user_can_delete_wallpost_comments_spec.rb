require 'rails_helper'

RSpec.feature 'wallpost comments' do
  scenario 'deleting comments' do
    sign_up
    click_link 'My Wall'
    fill_in 'wallpost[content]', with: 'Message text'
    click_button 'Submit'
    expect(page).to have_content('Message text')
    fill_in 'wallpostcomment[content]', with: 'Commenting'
    click_button 'Add comment'
    expect(page).to have_content('Commenting')
    click_link('Delete comment')
    expect(page).not_to have_content('Commenting')
  end
end
