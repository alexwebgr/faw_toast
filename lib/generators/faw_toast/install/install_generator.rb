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

      def add_stylesheet_tag
        inject_into_file "app/views/layouts/application.html.erb", after: "<%= stylesheet_link_tag \"application\", \"data-turbo-track\": \"reload\" %>" do
          "\n    <%= stylesheet_link_tag \"faw_toast\", \"data-turbo-track\": \"reload\" %>"
        end
      end

      def add_javascript_tag
        inject_into_file "app/views/layouts/application.html.erb", before: "</head>" do
          "  <%= javascript_include_tag \"faw_toast\", \"data-turbo-track\": \"reload\" %>\n"
        end
      end

      def add_toast_container_to_layout
        inject_into_file "app/views/layouts/application.html.erb", before: "</body>" do
          <<-HTML
  <%= toast_container %>
          HTML
        end
      end
    end
  end
end
