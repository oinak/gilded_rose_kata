%w(base brie backstage sulfuras).each do |lib|
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
        'Sulfuras, Hand of Ragnaros'                => Sulfuras
      }
    end
  end
end
