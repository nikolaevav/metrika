METRIKA_PATH = File.dirname(__FILE__) + "/metrika/"

require METRIKA_PATH + 'helpers/authorization'
require METRIKA_PATH + 'helpers/parser'
require METRIKA_PATH + 'helpers/request'

require METRIKA_PATH + 'api/methods'
require METRIKA_PATH + 'client'
require METRIKA_PATH + 'errors'

require 'oauth2'
require 'yajl'

module Metrika

  class << self
    attr_accessor :application_id, :application_password

    # config/initializers/metrika.rb (for instance)
    #
    # Metrika.configure do |config|
    #   config.application_id = 'application_id'
    #   config.application_password = 'application_password'    
    # end
    #
    # elsewhere
    #
    # client = Metrika::Client.new

    def configure
      yield self
      true
    end
  end
end