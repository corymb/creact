require "creact/version"

module Creact
  def self.get_absolute_path(file)
    location = File.dirname(__FILE__)
    "#{location}/../files/#{file}"
  end

  def self.create_dirs
    dirs = ['views', 'js']
    puts 'Creating the following dirs: ' + dirs.join(' ')
    FileUtils.makedirs dirs
  end

  def self.create_views(template=:mote)
    puts 'Creating view files...'
    # TODO: Refactor into a case statement:
    if template == :mote
      @view_files = ['layout.mote', 'home.mote']
    end
    files = @view_files.map { |file| get_absolute_path(file) }
    FileUtils.cp(files, 'views')
  end

  def self.create_js(template=:mote)
    puts 'Creating js files...'
    @js_files = ['jquery.js', 'reacting.rb'].map { |file| get_absolute_path(file) }
    FileUtils.cp(@js_files, 'js')
  end

  def self.create_react_module
    # TODO: Do I need this anymore?
    FileUtils.cp(get_absolute_path('react_helpers.rb'), '.')
  end

  def self.creact_react_entry_point
    FileUtils.cp(get_absolute_path('react.rb'), 'js')
  end

  def self.check_dir_empty(dir)
    (Dir.entries(dir) - %w{ . .. }).empty?
  end

  def self.delete_files
    @js_files = ['js/jquery.js', 'js/reacting.rb']
    @view_files = ['views/layout.mote', 'views/home.mote']
    puts "Destructive operation: 'yes' to continue"
    # confirm = gets.strip

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

      if self.check_dir_empty('views')
        puts 'Deleting directory: views...'
        FileUtils.rm_rf 'views'
      end

      if self.check_dir_empty('js')
        puts 'Deleting directory: js...'
        FileUtils.rm_rf 'js'
        puts 'Done'
      end
    else
      puts 'Aborted.'
    end
  end

  def self.run_generator
    self.create_dirs
    self.create_views
    self.create_js
    self.create_react_module
    self.creact_react_entry_point
  end
end
