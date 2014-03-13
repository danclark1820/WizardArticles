require_relative '../lib/csv_handler.rb'
require_relative '../lib/article.rb'
require 'rspec'
require 'pry'

describe CSVHandler do
  context 'working with files' do
    let(:test_path_for_writing){ "test_file.csv" }

    after(:each) do
      FileUtils.rm_f(test_path_for_writing)
    end

    it 'generates list of articles from a supplied csv' do
      articles = CSVHandler.load_from_csv('spec/fixtures/csv_sample.csv')
      expect(articles.size).to eq(1)
      expect(articles[0]).to be_kind_of(Article)

      file_contents = []
      CSV.foreach('spec/fixtures/csv_sample.csv', headers: true) do |csv|
        file_contents << csv
      end
      expect(articles[0].title).to eq(file_contents[0]["title"])
    end

    it 'returns an empty array if the file does not exist' do
      articles = CSVHandler.load_from_csv('nonexistent.csv')
      expect(articles.empty?).to be_true
    end

    it 'writes to a csv if it already exists' do
      FileUtils.touch(test_path_for_writing)
      CSV.open(test_path_for_writing, 'a+') do |csv|
        csv << ["title","url","descript"]
      end

      CSVHandler.write_to_csv(test_path_for_writing)

      lines = []
      CSV.foreach(test_path_for_writing, headers: true) do |csv|
        lines << csv
      end

      expect(lines[0]["title"]).to eq(article.title)
    end

  end
end
