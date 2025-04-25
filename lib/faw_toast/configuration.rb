# frozen_string_literal: true

module FawToast
  class Configuration
    attr_accessor :duration_seconds, :position, :css_classes

    def initialize
      @duration_seconds = 7 # seconds
      @position = 'top-right'
      @css_classes = {
        success: 'faw-toast-border-l-10 faw-toast-border-green-500',
        alert: 'faw-toast-border-l-10 faw-toast-border-red-500',
        info: 'faw-toast-border-l-10 faw-toast-border-sky-600',
        notice: 'faw-toast-border-l-10 faw-toast-border-sky-600',
        default: 'faw-toast-border-l-10 faw-toast-border-indigo-500'
      }
    end
  end
end
