module Updater
  class Brie < Base

    private

    def update_quality
      increase_quality
      increase_quality if item.sell_in < 1 && item.quality < 50
    end
  end
end
