require 'rspec'
require 'definition'
require 'word_definer'
require 'pry'

describe '#Definition' do
  
  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new({:name => "Tree", :id => nil})
    @word.save
  end
  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new({:definition => "a large plant with leaves", :word_id => @word.id, :id => nil})
      definition2 = Definition.new({:definition => "a large plant with leaves", :word_id => @word.id, :id => nil})
      expect(definition).to(eq(definition2))
    end
  end
  
  describe('#save') do
    it("saves a definition") do
      definition = Definition.new({:definition => "a large plant with leaves", :word_id => @word.id, :id => nil})
      definition.save
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new({:definition => "a large plant with leaves", :word_id => @word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:definition => "a four-legged canine", :word_id => @word.id, :id => nil})
      definition2.save
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new({:definition => "a large plant with leaves", :word_id => @word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:definition => "a four-legged canine", :word_id => @word.id, :id => nil})
      definition2.save
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new({:definition => "a large plant with leaves", :word_id => @word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:definition => "a four-legged canine", :word_id => @word.id, :id => nil})
      definition2.save
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      definition = Definition.new({:definition => "a large plant with leaves", :word_id => @word.id, :id => nil})
      definition.save
      definition.update("a striped equine", @word.id)
      expect(definition.definition).to(eq("a striped equine"))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      definition = Definition.new({:definition => "a large plant with leaves", :word_id => @word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:definition => "a four-legged canine", :word_id => @word.id, :id => nil})
      definition2.save
      definition.delete
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for a word") do
      word2 = Word.new({:name => "House", :id => nil})
      word2.save
      definition = Definition.new({:definition => "a large plant with leaves", :word_id => @word.id, :id => nil})
      definition.save
      definition2 = Definition.new({:definition => "a four-legged canine", :word_id => word2.id, :id => nil})
      definition2.save
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end
end