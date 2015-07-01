def update_quality(items)
  items.each do |item|
    Updater.new(item).update
  end
end

class Updater
  def initialize(item)
    @item = item
  end

  def update
    if item.name == 'Aged Brie'
      update_brie(item)
    elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
      update_backstage(item)
    elsif item.name == 'Sulfuras, Hand of Ragnaros'
      update_sulfuras(item)
    else
      update_default(item)
    end
  end

  private

  def item
    @item
  end

  def update_default(item)
    if item.quality > 0
      item.quality -= 1
    end

    item.sell_in -= 1

    if item.sell_in < 0
      if item.quality > 0
        item.quality -= 1
      end
    end
  end

  def update_sulfuras(item)
  end

  def update_backstage(item)
    if item.quality < 50
      item.quality += 1
      if item.sell_in < 11
        item.quality += 1
        if item.sell_in < 6
          item.quality += 1
        end
      end
    end

    item.sell_in -= 1

    if item.sell_in < 0
      item.quality = item.quality - item.quality
    end
  end

  def update_brie(item)
    if item.quality < 50
      item.quality += 1
    end

    item.sell_in -= 1

    if item.sell_in < 0
      if item.quality < 50
        item.quality += 1
      end
    end
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

