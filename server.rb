require 'sinatra'
require 'CSV'
require_relative 'lib/article.rb'

get '/' do
  @articles = []
  CSV.foreach('articles.csv') do |row|
    @articles << Article.new(row[0], row[1], row[2])
  end
  erb :index
end

get '/form' do
  erb :form
end

post '/form' do

  title = params['title']
  url = params['url']
  descript = params['descript']

  File.open('articles.csv', 'a') do |file|
    file.puts(title + ',' + url + ',' + descript)
  end

  redirect '/'

end




