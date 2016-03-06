require "creact/version"
require "creact/file_handlers"
# require 'jquery'
require 'opal'
# require 'opal-jquery'

module Creact
  def loader
    opal = Opal::Server.new {|s|
      s.append_path 'js'
      s.main = 'app'
    }
    puts opal
    Opal::Sprockets.load_asset('react', opal.sprockets)
  end
  #   opal = Opal::Server.new {|s|
  #     s.append_path 'js'
  #     s.main = 'app'
  #   }
  #   opal_boot_code = Opal::Processor.load_asset_code(opal.sprockets, 'react')
  #   puts 1
  #   puts opal
  #   puts opal_boot_code
  #   puts 2
  # end
end
