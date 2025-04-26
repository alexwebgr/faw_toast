# frozen_string_literal: true

module FawToast
  class Configuration
    attr_accessor :duration_seconds, :position, :css_classes

    def initialize
      @duration_seconds = "7s"
      @position = 'top-right'
      @css_classes = {
        success: 'faw-toast-border-l-10 faw-toast-border-green',
        alert: 'faw-toast-border-l-10 faw-toast-border-red',
        danger: 'faw-toast-border-l-10 faw-toast-border-red',
        info: 'faw-toast-border-l-10 faw-toast-border-sky',
        notice: 'faw-toast-border-l-10 faw-toast-border-sky',
        default: 'faw-toast-border-l-10 faw-toast-border-indigo'
      }
    end
  end
end
