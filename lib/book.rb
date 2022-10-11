class Book < Item
  def initialize(publisher, cover_state, publish_date, label: nil, source: nil, author: nil, genre: nil)
    super(publish_date, label: label, source: source, author: author, genre: genre)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
