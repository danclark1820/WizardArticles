require 'sinatra'
require 'CSV'

get '/' do
  @articles = []
  CSV.foreach('articles.csv') do
    @articles << Article.new
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

end




