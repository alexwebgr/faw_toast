# frozen_string_literal: true

module FawToast
  class Configuration
    attr_accessor :duration_seconds, :position, :css_classes, :progress_bar_bg

    def initialize
      @duration_seconds = "7s"
      @position = 'top-right'
      @progress_bar_bg = "rgba(0, 0, 0, 0.2)"
      @css_classes = {
        success: 'faw-toast-border-green',
        alert: 'faw-toast-border-red',
        danger: 'faw-toast-border-red',
        info: 'faw-toast-border-sky',
        notice: 'faw-toast-border-sky',
        default: 'faw-toast-border-indigo'
      }
    end
  end
end
