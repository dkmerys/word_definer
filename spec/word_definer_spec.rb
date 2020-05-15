require 'rspec'
require 'pry'
require 'word_definer'
require 'definition'

describe '#Word' do

  before(:each) do
    Word.clear
    Definition.clear
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

  describe('#update') do
    it("updates a word by id") do
      word = Word.new({:name => "Tree", :id => nil})
      word.save
      word.update("House")
      expect(word.name).to(eq("House"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new({:name => "Tree", :id => nil})
      word.save
      word2 = Word.new({:name => "House", :id => nil})
      word2.save
      word.delete
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('.search') do
    it("allows user to search for a word") do
      word = Word.new({:name => "Tree", :id => nil})
      word.save
      word2 = Word.new({:name => "House", :id => nil})
      word2.save
      expect(Word.search(word.name)).to(eq([word]))
    end
  end

  describe('#definitions') do
    it("returns a word's definitions") do
      word = Word.new({:name => "Tree", :id => nil})
      word.save
      definition = Definition.new({:definition => "a large plant with leaves", :word_id => word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:definition => "a four-legged canine", :word_id => word.id, :id => nil})
      definition2.save
      expect(word.definitions).to(eq([definition, definition2]))
    end
  end
end 