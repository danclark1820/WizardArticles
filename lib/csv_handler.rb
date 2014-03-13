require 'CSV'
class CSVHandler

  class << self
    def load_from_csv(filename)
      articles = []
      if FileTest.exists?(filename)
        CSV.foreach(filename, headers: true) do |csv|
          articles << Article.new(csv["title"], csv["url"], csv["descript"])
        end
      end
      articles
    end
  end

  def write_to_csv(filename)
  end
end
