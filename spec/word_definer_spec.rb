require 'rspec'
require 'pry'
require 'word_definer'

describe '#Word' do
  
  describe('#save') do
    it("saves a word") do
      word = Word.new({:name => "Tree", :id => nil})
      word.save
      word2 = Word.new({:name => "House", :id => nil})
      word2.save
      expect(Word.all).to(eq([word, word2]))
    end
  end
end