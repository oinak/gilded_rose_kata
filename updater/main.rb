require_relative 'factory.rb'

module Updater
  module Main
    def update_quality(items)
      items.each do |item|
        updater = Updater::Factory.get(item)
        updater.update
      end
    end
  end
end
