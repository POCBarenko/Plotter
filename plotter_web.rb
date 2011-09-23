$LOAD_PATH << './lib'
require 'rubygems'
require 'sinatra'
require 'plotter'

get '/' do
  erb :index
end

get '/:function' do
  Plotter.new.plot(params[:function]).values.first.to_s
end

get '/:function/csv' do
  Plotter.new.plot_csv(params[:function])
end
