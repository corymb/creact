require_relative '../lib/creact.rb'

class CreactTest
  def test_react_loader_string
    react_loader = Creact.loader
    react_loader.include?'opal'
    react_loader.include?'corelib/runtime.self'
    react_loader.include?'jquery.self'
    react_loader.include?'sources/react.self'
    react_loader.include?'Opal.load("react");'
  end
end
