module Updater
  class Conjured < Base

    private

    def update_quality
      decrease_quality(item.sell_in < 1 ? 4 : 2)
    end
  end
end
