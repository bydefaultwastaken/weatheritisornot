class SearchesScores
  attr_reader :query, :result

  def initialize(query:, base: Score.all)
    @query  = query
    @result = base
  end

  def call
    if query
      @result = result.near(query)
    end

    @result
  end
end