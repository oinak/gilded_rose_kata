module Updater
  class Backstage < Base

    private

    def update_quality
      if item.sell_in < 1
        item.quality = 0
      else
        increase_quality
        increase_quality if item.sell_in < 11
        increase_quality if item.sell_in < 6
      end
    end
  end
end
