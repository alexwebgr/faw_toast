# frozen_string_literal: true

module FawToast
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      desc "Installs FawToast configuration"

      def copy_initializer
        template "faw_toast.rb", "config/initializers/faw_toast.rb"
      end

      def add_css_variables_to_layout
        inject_into_file "app/views/layouts/application.html.erb", after: "<head>" do
          <<-HTML

  <%= toast_css_variables %>
          HTML
        end
      end

      def add_toast_container_to_layout
        inject_into_file "app/views/layouts/application.html.erb", before: "</body>" do
          <<-HTML

  <div id="toast-container" class="toast-container <%= FawToast.configuration.position %>">
    <%= render_toast %>
  </div>
          HTML
        end
      end

      def add_stylesheet_import
        if File.exist?("app/assets/stylesheets/application.scss")
          append_to_file "app/assets/stylesheets/application.scss" do
            "\n@import \"faw_toast\";\n"
          end
        else
          say "Please manually import the FawToast stylesheet in your application", :red
        end
      end

      def copy_javascript_controller
        template "toast_controller.js", "app/javascript/controllers/toast_controller.js"

        if File.exist?("app/javascript/controllers/index.js")
          inject_into_file "app/javascript/controllers/index.js" do
            "\nimport ToastController from \"./toast_controller\"\napplication.register(\"toast\", ToastController)"
          end
        else
          say "Please manually register the toast controller in your Stimulus application", :red
        end
      end
    end
  end
end
