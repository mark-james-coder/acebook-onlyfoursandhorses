require 'rails_helper'

RSpec.feature 'Username in URL' do
  scenario 'access user wall via url' do
    sign_up
    click_link 'Log out'
    sign_up_another_account
    visit '/users/test-johnson'
    expect(page).to have_content "Test Johnson's Wall"
  end
end
