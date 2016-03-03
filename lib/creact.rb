require "creact/version"
require "creact/file_handlers"
# If you uncomment this, it'll break:
# require 'opal'


module Creact
  def loader
    'Test string'
    # opal = Opal::Server.new {|s|
    #   s.append_path 'js'
    #   s.main = 'app'
    # }
    # opal_boot_code = Opal::Processor.load_asset_code(opal.sprockets, 'react')
  end
end
