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

describe('edit a definition path', {:type => :feature}) do
  it('creates an word, goes to the definition page, then edits a definition') do
    word = Word.new({:name => "Tree", :id => nil})
    word.save
    visit("/words/#{word.id}")
    fill_in('new_def', :with => 'a plant with a trunk')
    click_on('Add definition')
    click_on('a plant with a trunk')
    fill_in('edit_def', :with => 'brown trunk green leaves')
    click_on('Change')
    expect(page).to have_content('brown trunk green leaves')
  end
end

describe('edit a definition path', {:type => :feature}) do
  it('creates an word, goes to the definition page, then deletes a definition') do
    word = Word.new({:name => "Tree", :id => nil})
    word.save
    visit("/words/#{word.id}")
    fill_in('new_def', :with => 'a plant with a trunk')
    click_on('Add definition')
    fill_in('new_def', :with => 'brown trunk green leaves')
    click_on('Add definition')
    click_on('a plant with a trunk')
    click_on('Delete definition')
    expect(page).to have_content('brown trunk green leaves')
  end
end