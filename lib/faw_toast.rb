# frozen_string_literal: true

require_relative "faw_toast/version"
require_relative "faw_toast/engine"
require_relative "faw_toast/configuration"
require_relative "faw_toast/toast_helper"

module FawToast
  class Error < StandardError; end

  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
