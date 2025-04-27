# frozen_string_literal: true

module FawToast
  module ToastHelper
    def flash_class(type)
      position = FawToast.configuration.position
      color_class = FawToast.configuration.css_classes[type.to_sym] || FawToast.configuration.css_classes[:default]
      border_class = border_class_for_position(position)
      animation_class = animation_class_for_position(position)

      [color_class, border_class, animation_class].join(" ")
    end

    def render_toast
      render partial: "faw_toast/toast"
    end

    def toast_container
      content_tag :div, id: "faw-toast-container", class: "faw-toast-container faw-toast-#{FawToast.configuration.position}" do
        render_toast
      end
    end
    
    def render_message(flash_type = :success, status = :ok, message = nil)
      flash.now[flash_type] = message
      render turbo_stream: turbo_stream.append("faw-toast-container", partial: "faw_toast/toast"), status: status
    end

    def toast_css_variables
      # Generate a style tag with CSS variables based on configuration
      content_tag :style do
        ":root {
            --faw-toast-duration: #{FawToast.configuration.duration_seconds};
            --faw-toast-progress-bar-bg: #{FawToast.configuration.progress_bar_bg};
         }".html_safe
      end
    end

    private

    def border_class_for_position(position)
      case position
      when 'top-left', 'bottom-left'
        'faw-toast-border-right-10'
      when 'top-center', 'bottom-center'
        'faw-toast-border-top-10'
      else # top-right, bottom-right, or any other
        'faw-toast-border-left-10'
      end
    end

    def animation_class_for_position(position)
      case position
      when 'top-right', 'bottom-right'
        'faw-toast-slide-right'
      when 'top-left', 'bottom-left'
        'faw-toast-slide-left'
      when 'top-center'
        'faw-toast-slide-top'
      when 'bottom-center'
        'faw-toast-slide-bottom'
      else
        'faw-toast-slide-right' # Default
      end
    end
  end
end
