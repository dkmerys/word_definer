require 'rspec'
require 'pry'
require 'word_definer'

describe '#Word' do

  before(:each) do
    Word.clear
  end
  
  describe('#save') do
    it("saves a word") do
      word = Word.new({:name => "Tree", :id => nil})
      word.save
      word2 = Word.new({:name => "House", :id => nil})
      word2.save
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new({:name => "Tree", :id => nil})
      word.save
      word2 = Word.new({:name => "House", :id => nil})
      word2.save
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
    word = Word.new({:name => "Tree", :id => nil})
    word2 = Word.new({:name => "Tree", :id => nil})
    expect(word).to(eq(word2))
    end
  end

  describe('.find') do
    it("finds an word by id") do
      word = Word.new({:name => "Tree", :id => nil})
      word.save
      word2 = Word.new({:name => "House", :id => nil})
      word2.save
      expect(Word.find(word.id)).to(eq(word))
    end 
  end
end 