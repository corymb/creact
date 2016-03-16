require 'spec_helper'

describe Creact::FileOperations do
  it 'creates js directory' do
    expect(Dir.exists? 'js').to be false
  end
  it 'creates css directory' do
    expect(Dir.exists? 'css').to be false
    # Creact::FileOperations.create_dirs
  end
end
