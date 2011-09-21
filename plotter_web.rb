$LOAD_PATH << './lib'
require 'rubygems'
require 'sinatra'
require 'plotter'

get '/' do
  'put index here'
end

get '/:function' do
  Plotter.new.plot(params[:function]).values.first.to_s
end
