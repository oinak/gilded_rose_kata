module Updater
  class Brie < Base

    private

    def update_quality
      increase_quality(item.sell_in < 1 ? 2 : 1)
    end
  end
end
