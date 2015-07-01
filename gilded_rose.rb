def update_quality(items)
  items.each do |item|
    updater = Updater.get_updater(item)
    updater.update
  end
end

module Updater
  def get_updater(item)
    if item.name == 'Aged Brie'
      Brie.new(item)
    elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
      Backstage.new(item)
    elsif item.name == 'Sulfuras, Hand of Ragnaros'
      Sulfuras.new(item)
    else
      Base.new(item)
    end
  end
  module_function :get_updater

  class Base
    def initialize(item)
      @item = item
    end

    def update
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

    private

    def item
      @item
    end
  end

  class Sulfuras < Base
    def update
    end
  end

  class Backstage < Base
    def update
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
  end

  class Brie < Base
    def update
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

