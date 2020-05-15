require 'rspec'
require 'definition'
require 'word_definer'
require 'pry'

describe '#Definition' do
  
  before(:each) do
    Word.clear()
    # Definition.clear()
    @word = Word.new({:name => "Tree", :id => nil})
    @word.save
  end
  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new({:definition =>"a large plant with leaves", :word_id => @word.id, :id => nil})
      definition2 = Definition.new({:definition =>"a large plant with leaves", :word_id => @word.id, :id => nil})
      expect(definition).to(eq(definition2))
    end
  end
end