feature 'welcome page' do
  scenario 'it greets a user' do
    visit '/'
    expect(page).to have_content("New to Acebook? Sign up, it's free!")
  end
end
