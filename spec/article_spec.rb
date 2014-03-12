require 'rspec'
require_relative '../lib/article.rb'

describe Article do
  article_obj = Article.new('New Potions','www.wizards.com', 'A list of new potions.')
  it 'has a title' do
    expect(article_obj.title).to eq('New Potions')
  end

  it 'has a URL' do
    expect(article_obj.url).to eq('www.wizards.com')
  end

  it 'has a description' do
    expect(article_obj.descript).to eq('A list of new potions.')
  end

end
