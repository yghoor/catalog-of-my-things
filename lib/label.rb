class Label
  attr_reader :title, :color, :items

  def initialize(title, color)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
