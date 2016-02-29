require "creact/version"

module Creact
  def self.create_dirs
    FileUtils.cd '.'  #TODO: Update this to project dir.
    dirs = ['views', 'js']
    puts 'Creating the following dirs: ' + dirs.join(' ')
    FileUtils.makedirs dirs
  end

  def self.create_views(template=:mote)
    puts 'Creating view files...'
    if template == :mote
      @view_files = ['files/layout.mote', 'files/home.mote']
    end
    FileUtils.cp(@view_files, 'views')
  end

  def self.create_js(template=:mote)
    puts 'Creating js files...'
    @js_files = ['files/jquery.js', 'files/reacting.rb']
    FileUtils.cp(@js_files, 'js')
  end

  def self.run_generator
    self.create_dirs
    self.create_views
    self.create_js
  end

  def self.check_dir_empty(dir)
    (Dir.entries(dir) - %w{ . .. }).empty?
  end

  def self.delete_files
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
end
