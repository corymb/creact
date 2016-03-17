require 'spec_helper'

describe Creact::FileOperations do

  after :each do
    Creact::FileOperations.delete_dirs
  end

  it 'creates js directory' do
    expect(Dir.exists? 'js').to be false
    Creact::FileOperations.create_dirs
    expect(Dir.exists? 'js').to be true
  end

  it 'creates views directory' do
    expect(Dir.exists? 'views').to be false
    Creact::FileOperations.create_dirs
    expect(Dir.exists? 'views').to be true
  end

  it 'creates home.mote' do
    expect(File.exists? 'views/home.mote').to be false
    Creact::FileOperations.create_dirs
    Creact::FileOperations.create_views
    expect(File.exists? 'views/home.mote').to be true
  end

  it 'creates layout.mote' do
    expect(File.exists? 'views/layout.mote').to be false
    Creact::FileOperations.create_dirs
    Creact::FileOperations.create_views
    expect(File.exists? 'views/layout.mote').to be true
  end

  it 'creates jquery.js' do
    expect(File.exists? 'js/jquery.js').to be false
    Creact::FileOperations.create_dirs
    Creact::FileOperations.create_js
    expect(File.exists? 'js/jquery.js').to be true
  end
end
