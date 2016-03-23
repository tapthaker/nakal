require 'calabash-cucumber/core'

module Nakal
  module Ios
    class Screen < Common::BaseScreen
      include Calabash::Cucumber::Core

      def capture
        sleep 1
        base64Image = backdoor('takeFullScreenShot:',{})
        File.open("#{Nakal.image_location}/#{@name}.png", 'wb') do|f|
          f.write(Base64.decode64(base64Image))
        end
      end
    end
  end
end