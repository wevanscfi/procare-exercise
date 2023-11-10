# frozen_string_literal: true

ENV['RAILS_ENV'] = 'test'

require 'karafka/testing/rspec/helpers'
require 'simplecov'
require "simplecov_json_formatter"
SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter
SimpleCov.start 'rails'

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.order = :random
  config.include Karafka::Testing::RSpec::Helpers
end

require File.expand_path('../config/environment', __dir__)
require './karafka'
