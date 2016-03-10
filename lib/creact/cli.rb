require 'thor'

module Creact
  class Generate < Thor
    desc "generate", "This will generate mote and js files."
    long_desc <<-GENERATE

    `generate` will generate the following tree in your project:

      ├── js
      │   ├── jquery.js
      │   └── react.rb
      ├── views
      │   ├── home.mote
      │   └── layout.mote

      This will integrate React into your project.

    GENERATE
    # option :upcase
    def generate( template=nil )
      # greeting = "Hello, #{template}"
      # greeting.upcase! if options[:upcase]
      # puts greeting
      Creact::FileOperations.run_generator

    end
  end
end
