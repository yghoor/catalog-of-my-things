class Book < Item
  attr_reader :publisher, :cover_state
  
  # rubocop:disable Metrics/ParameterLists
  def initialize(publisher, cover_state, publish_date, label: nil, source: nil, author: nil, genre: nil)
    super(publish_date, label: label, source: source, author: author, genre: genre)
    @publisher = publisher
    @cover_state = cover_state
  end
  # rubocop:enable Metrics/ParameterLists

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
