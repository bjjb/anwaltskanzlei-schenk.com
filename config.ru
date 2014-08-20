require 'bundler/setup'
require './lib/application'

use Rack::Static, root: 'public', urls: ['/doc', '/img']
run Application
