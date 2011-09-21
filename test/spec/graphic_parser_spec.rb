$LOAD_PATH << './../../lib'
require 'graphic_parser'

describe GraphicParser do
  before :each do
    @graphic_parser = GraphicParser.new
  end
  
  it "must return nil when no function" do
    @graphic_parser.parse(nil).should be nil
  end
  
  it "f(x) = 1" do
    sample = Proc.new{|x| 1}
    test = @graphic_parser.parse("1")
    -5.upto(5) {|n| test.call(n).should be sample.call(n)}
  end
  
  it "f(x) = 1x + 2" do
    sample = Proc.new{|x| x + 2}
    test = @graphic_parser.parse("x + 2")
    -5.upto(5) {|n| test.call(n).should be sample.call(n)}
  end
  
  it "f(x) = x**2 + 2x + 1" do
    sample = Proc.new{|x| x**2 + 2*x + 1}
    test = @graphic_parser.parse("x**2 + 2*x + 1")
    -5.upto(5) {|n| test.call(n).should be sample.call(n)}
  end
end