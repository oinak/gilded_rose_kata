module Updater
  class Base
    def initialize(item)
      @item = item
    end

    def update
      update_quality
      update_sell_in
    end

    private

    def item
      @item
    end

    def update_quality
      decrease_quality
      decrease_quality if item.sell_in < 1
    end

    def increase_quality(value = 1)
      value.times do
        item.quality += 1 unless item.quality >= 50
      end
    end

    def decrease_quality(value = 1)
      value.times do
        item.quality -= 1 unless item.quality <= 0
      end
    end

    def clear_quality
      decrease_quality(item.quality)
    end

    def update_sell_in
      item.sell_in -= 1
    end
  end
end
