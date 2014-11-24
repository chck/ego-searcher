root = ::File.dirname(__FILE__)
require ::File.join(root, 'app')
require './app/ego-searcher'

run EgoSearcher
