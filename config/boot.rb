require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'rails/commands/server'
module Rails
  class Server
    def default_options
      if Rails.env.development?
        super.merge!(:Port => (ENV['PORT'] || 1990))
      else
        super
      end
    end
  end
end
