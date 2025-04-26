# frozen_string_literal: true

module FawToast
  module ToastHelper
    def flash_class(type)
      FawToast.configuration.css_classes[type.to_sym] || FawToast.configuration.css_classes[:default]
    end

    def render_toast
      render partial: "faw_toast/toast"
    end

    def toast_container
      content_tag :div, id: "faw-toast-container", class: "faw-toast-container faw-toast-#{FawToast.configuration.position}" do
        render_toast
      end
    end

    def toast_css_variables
      # Generate a style tag with CSS variables based on configuration
      content_tag :style do
        ":root { --faw-toast-duration: #{FawToast.configuration.duration_seconds}; }".html_safe
      end
    end
  end
end
