class OpenGraphService
  def initialize(url)
    @url = url
  end

  def call
    OpenGraph.new(@url)
  end
end