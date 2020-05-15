require('sinatra')
require('sinatra/reloader')
require('./lib/word_definer')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

post('/words') do
  new_word = params[:new_word]
  word = Word.new({:name => new_word, :id => nil})
  word.save
  @words = Word.all
  erb(:words)
end

get('/words/search') do
  @search_result = Word.search(params[:search])
  erb(:search_results)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:new_name])
  @words = Word.all
  erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete
  @words = Word.all
  erb(:words)
end