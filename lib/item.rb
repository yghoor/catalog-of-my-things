class Item
  attr_reader :publish_date, :label, :source, :author, :genre

  def initialize(publish_date, label: nil, source: nil, author: nil, genre: nil)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @label = label
    @source = source
    @author = author
    @genre = genre
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  private

  def can_be_archived?
    Time.now.year - Date._strptime(@publish_date, '%d/%m/%Y')[:year] > 10
  end
end
