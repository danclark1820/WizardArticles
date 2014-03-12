class Article
  attr_reader :title, :url, :descript
  def initialize(title, url, descript)
    @title = title
    @url = url
    @descript = descript
  end
end
