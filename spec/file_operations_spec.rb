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

  it 'creates css directory' do
    expect(Dir.exists? 'css').to be false
    Creact::FileOperations.create_dirs
    expect(Dir.exists? 'js').to be true
  end

end
