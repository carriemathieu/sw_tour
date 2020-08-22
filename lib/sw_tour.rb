module SwTour
  class Error < StandardError; end
  # Your code goes here...
end

require 'pry'
require 'rest-client'
require 'json'
require_relative "./sw_tour/version"
require_relative "./sw_tour/CLI"
require_relative "./sw_tour/planets"
require_relative "./sw_tour/API"