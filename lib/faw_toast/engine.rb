# frozen_string_literal: true

module FawToast
  class Engine < ::Rails::Engine
    isolate_namespace FawToast

    initializer "faw_toast.helpers" do
      ActiveSupport.on_load(:action_controller) do
        include FawToast::ToastHelper
      end

      ActiveSupport.on_load(:action_view) do
        include FawToast::ToastHelper
      end
    end

    initializer "faw_toast.flash_types" do
      ActionController::Base.add_flash_types :success, :info, :danger
    end
  end
end
