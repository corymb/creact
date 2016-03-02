require "creact/version"

module Creact
  def self.create_dirs
    FileUtils.cd Dir.pwd
    dirs = ['views', 'js']
    puts 'Creating the following dirs: ' + dirs.join(' ')
    FileUtils.makedirs dirs
  end

  def self.create_views(template=:mote)
    FileUtils.cd Dir.pwd
    puts 'Creating view files...'
    location = File.dirname(__FILE__)
    if template == :mote
      @view_files = ['../files/layout.mote', '../files/home.mote']
      files = @view_files.map { |file| "#{location}/#{file}" }
    end
    FileUtils.cp(files, 'views')
  end

  def self.create_js(template=:mote)
    FileUtils.cd Dir.pwd
    puts 'Creating js files...'
    @js_files = ['files/jquery.js', 'files/reacting.rb']
    FileUtils.cp(@js_files, 'js')
  end

  def self.create_react_module
    FileUtils.cd Dir.pwd
    FileUtils.cp('files/react_helpers.rb', '.')
  end

  def self.creact_react_entry_point
    FileUtils.cd Dir.pwd
    FileUtils.cp('files/react.rb', 'js')
  end

  def self.check_dir_empty(dir)
    FileUtils.cd Dir.pwd
    (Dir.entries(dir) - %w{ . .. }).empty?
  end

  def self.delete_files
    FileUtils.cd Dir.pwd
    @js_files = ['js/jquery.js', 'js/reacting.rb']
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

      if self.check_dir_empty('views')
        puts 'Deleting directory: views...'
        FileUtils.rm_rf 'views'
      end

      if self.check_dir_empty('js')
        puts 'Deleting directory: js...'
        FileUtils.rm_rf 'js'
      end
      puts 'Done'
    else
      puts 'Aborted.'
    end
  end

  def self.run_generator
    self.create_dirs
    self.create_views
    # self.create_js
    # self.create_react_module
    # self.creact_react_entry_point
  end
end
