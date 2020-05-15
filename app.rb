require('sinatra')
require('sinatra/reloader')
require('./lib/word_definer')
require('./lib/definition')
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

get('words') do
  if(params[:search])
    @words = Word.search(params[:search])
  else
    @words = Word.all
  end
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

get('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(:definition => (params[:new_def]), :word_id => @word.id, :id =>nil)
  definition.save
  erb(:word)
end

patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(param[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:edit_def], @word.id)
  erb(:word)
end

delete('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:album)
end