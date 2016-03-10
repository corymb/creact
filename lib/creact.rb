require "creact/version"
require "creact/file_handlers"
require 'opal'
require 'opal-jquery'
require 'reactive-ruby'
require 'creact/cli'

module Creact
  def loader
    opal = Opal::Server.new {|s|
      s.append_path 'js'
      s.main = 'react'
    }
    Opal::Processor.load_asset_code(opal.sprockets, 'react')
  end
end
