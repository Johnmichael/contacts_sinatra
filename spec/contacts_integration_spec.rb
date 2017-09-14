require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('You have', {:type => :feature}) do
  it('Processes user input and displays it') do
    visit('/')
    fill_in('first_name', :with => 'shoes')
    fill_in('last_name', :with => 'hats')
    click_button('Add Contact')
    expect(page).to have_content('shoes hats')
  end

  it('Deletes the user input and returns home') do
    visit('/')
    fill_in('first_name', :with => 'things')
    fill_in('last_name', :with => 'stuff')
    click_button('Add Contact')
    visit('/1')
    click_button('Delete')
    save_and_open_page
    expect(page).to have_no_content('shoes')
  end
end
