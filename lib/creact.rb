require "creact/version"

module Creact
  def self.create_dirs
    FileUtils.cd '.'  #TODO: Update this to project dir.
    dirs = ['views', 'js']
    puts 'Creating the following dirs: ' + dirs.join(' ')
    FileUtils.makedirs dirs
  end

  def self.create_views
  end

  def self.run_generator
    self.create_dirs
  end
end
