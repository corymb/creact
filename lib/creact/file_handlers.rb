module Creact
  module FileOperations
    extend self
    def get_absolute_path(file)
      location = File.dirname(__FILE__)
      "#{location}/../files/#{file}"
    end

    def create_dirs
      dirs = ['views', 'js']
      puts 'Creating the following dirs: ' + dirs.join(' ')
      FileUtils.makedirs dirs
    end

    def create_views(template=:mote)
      puts 'Creating view files...'
      # TODO: Refactor into a case statement:
      if template == :mote
        @view_files = ['layout.mote', 'home.mote']
      end
      files = @view_files.map { |file| get_absolute_path(file) }
      FileUtils.cp(files, 'views')
    end

    def create_js(template=:mote)
      puts 'Creating js files...'
      @js_files = ['jquery.js', 'react.rb'].map { |file| get_absolute_path(file) }
      FileUtils.cp(@js_files, 'js')
    end

    def create_react_module
      # TODO: Do I need this anymore?
      FileUtils.cp(get_absolute_path('react_helpers.rb'), '.')
    end

    def creact_react_entry_point
      FileUtils.cp(get_absolute_path('react.rb'), 'js')
    end

    def check_dir_empty(dir)
      (Dir.entries(dir) - %w{ . .. }).empty?
    end

    def delete_files
      @js_files = ['js/jquery.js', 'js/react.rb']
      @view_files = ['views/layout.mote', 'views/home.mote']
      puts "Destructive operation: 'yes' to continue"
      confirm = gets.strip

      if confirm == 'yes'
        puts 'Deleting...'
        puts @view_files
        FileUtils.rm @view_files
        puts @js_files
        FileUtils.rm @js_files
        puts 'React entry point'
        FileUtils.rm 'js/react.rb'
        puts 'React helper module'
        FileUtils.rm 'react_helpers.rb'

        if check_dir_empty('views')
          puts 'Deleting directory: views...'
          FileUtils.rm_rf 'views'
        end

        if check_dir_empty('js')
          puts 'Deleting directory: js...'
          FileUtils.rm_rf 'js'
          puts 'Done'
        end
      else
        puts 'Aborted.'
      end
    end

    def run_generator
      create_dirs
      create_views
      create_js
      create_react_module
      creact_react_entry_point
    end
  end
end
