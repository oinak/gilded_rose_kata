%w(base brie backstage conjured sulfuras).each do |lib|
  require_relative "#{lib}.rb"
end

module Updater
  module Factory
    extend self

    def get(item)
      updater[item.name].new(item)
    end

    private

    def updater
      Hash.new(Base).merge(updaters)
    end

    def updaters
      {
        'Aged Brie'                                 => Brie,
        'Backstage passes to a TAFKAL80ETC concert' => Backstage,
        'Conjured Mana Cake'                        => Conjured,
        'Sulfuras, Hand of Ragnaros'                => Sulfuras
      }
    end
  end
end
