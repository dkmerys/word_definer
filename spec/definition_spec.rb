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
end