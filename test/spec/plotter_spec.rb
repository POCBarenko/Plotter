$LOAD_PATH << './../../lib'
require 'plotter'

describe Plotter do
  before :each do
    @plotter = Plotter.new
  end
  
  it "must return a empty map when no function" do
    @plotter.domain = (0..5)
    @plotter.precision = 1
    @plotter.plot().should eql Hash.new
  end
  
  it "f(x) = 1" do
    graph = {}
    -5.upto(5) {|n| graph[n] = 1}
    answer = {}
    answer['1'] = graph
    
    @plotter.domain = (-5..5)
    @plotter.precision = 1
    @plotter.plot('1').should eql answer
  end
  
  it "f(x) = 1x + 2" do
    graph = {}
    -5.upto(5) {|n| graph[n] = n + 2}
    answer = {}
    answer['x + 2'] = graph
    
    @plotter.domain = (-5..5)
    @plotter.precision = 1
    @plotter.plot('x + 2').should eql answer
  end
  
  it "f(x) = x**2 + 2x + 1" do
    graph = {}
    -5.upto(5) {|n| graph[n] = (n**2) + 2*n + 1}
    answer = {}
    answer['x**2 + 2*x + 1'] = graph
    
    @plotter.domain = (-5..5)
    @plotter.precision = 1
    @plotter.plot('x**2 + 2*x + 1').should eql answer
  end
end