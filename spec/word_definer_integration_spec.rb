require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('new_word', :with => 'Reggae')
    click_on('Add!')
    expect(page).to have_content('Reggae')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates an word and then goes to the definition page') do
    word = Word.new({:name => "Tree", :id => nil})
    word.save
    visit("/words/#{word.id}")
    fill_in('new_def', :with => 'a plant with a trunk')
    click_on('Add definition')
    expect(page).to have_content('a plant with a trunk')
  end
end