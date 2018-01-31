# Add this directory to $LOAD_PATH
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(dir) unless $LOAD_PATH.include?(dir)

require 'mrrobot/version'
require 'mrrobot/logging'
require 'mrrobot/app'
