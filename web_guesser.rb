require 'sinatra'
require 'sinatra/reloader'

get '/' do
  r = Random.new
  "THE SECREt number is #{r.rand(100)}\n"
end
