require 'rails_helper'

RSpec.feature 'comments - wallposts' do
  scenario 'unknown user' do
    sign_up
    visit '/users/2'
    expect(page).to have_content 'This user does not exist'
  end
  scenario 'unknown post' do
    sign_up
    visit '/users/1/posts/1'
    expect(page).to have_content 'This post does not exist'
  end
end
