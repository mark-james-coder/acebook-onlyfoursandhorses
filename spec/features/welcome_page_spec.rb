feature 'welcome page' do
  scenario 'it greets a user' do
    visit '/'
    expect(page).to have_content("New to Acebook? Sign up, it's free!")
  end
  scenario 'redirects logged in user' do
    sign_up
    visit '/'
    expect(current_path).to eq('/users/1')
  end
end
