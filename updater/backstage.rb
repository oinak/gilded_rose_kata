module Updater
  class Backstage < Base

    private

    def update_quality
      if item.sell_in < 1
        clear_quality
      else
        increase_quality quality_delta
      end
    end

    def quality_delta
      if item.sell_in < 6
        3
      else
        item.sell_in < 11 ? 2 : 1
      end
    end
  end
end
