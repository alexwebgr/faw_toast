# FawToast
A simple, configurable toast notification system for Rails applications. FawToast provides an easy way to display flash messages as toast notifications with minimal setup.

[![Gem Version](https://badge.fury.io/rb/faw_toast.svg)](https://badge.fury.io/rb/faw_toast)

## Features

- Easy integration with Rails 7+ applications
- CSS-only animations
- Configurable toast duration and position
- Customizable CSS classes for different flash types
- Support for standard flash types plus additional success, info and danger types
- Simple to install and use

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'faw_toast'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install faw_toast
```

After installing the gem, run the installation generator:

```bash
rails generate faw_toast:install
```

This will:
1. Create a configuration initializer at `config/initializers/faw_toast.rb`
2. Add the toast container to your application layout

Include the css and javascript files in your `application.html.erb` layout file.

For `propshaft`
```erb
  <%= stylesheet_link_tag "faw_toast", "data-turbo-track": "reload" %>
  <%= javascript_include_tag "faw_toast", "data-turbo-track": "reload", type: "module" %>
```
and if you are using `sprockets` include the following lines in your `config/manifest.js`
```javascript
//= link faw_toast.js
//= link faw_toast.css
```

## Usage

FawToast works with Rails flash messages. You can use it like this

```ruby
# In your controller
def create
  # Your logic here
  flash[:success] = "Item was successfully created!"
  redirect_to items_path
end

# using Turbo Streams
flash.now[flash_type] = message
render turbo_stream: turbo_stream.append("faw-toast-container", partial: "faw_toast/toast"), status: status

```

```ruby
# In your background job or service object
flash = {}
flash[type] = message
Turbo::StreamsChannel.broadcast_append_to(
  channel,
  target: "faw-toast-container",
  partial: "faw_toast/toast",
  locals: { flash: flash }
)
```

FawToast supports the following flash types out of the box:
- `:success` - Green border
- `:alert` - Red border
- `:danger` - Red border (same as alert, but provides semantic difference)
- `:info` - Sky blue border
- `:notice` - Sky blue border
- Any other type will use the default indigo border

## Configuration

You can configure FawToast by editing the initializer at `config/initializers/faw_toast.rb`:

```ruby
FawToast.configure do |config|
  # Duration in seconds for which the toast will be displayed
  config.duration_seconds = '7s'

  # Position of the toast container
  # Available options: 'top-right', 'top-left', 'bottom-right', 'bottom-left', 'top-center', 'bottom-center'
  config.position = 'top-right'

  # CSS classes for different flash types
  config.css_classes = {
    success: 'faw-toast-border-l-10 faw-toast-border-green',
    alert: 'faw-toast-border-l-10 faw-toast-border-red',
    danger: 'faw-toast-border-l-10 faw-toast-border-red',
    info: 'faw-toast-border-l-10 faw-toast-border-sky',
    notice: 'faw-toast-border-l-10 faw-toast-border-sky',
    default: 'faw-toast-border-l-10 faw-toast-border-indigo'
  }
end
```

## How It Works

FawToast uses CSS animations to show and hide toast notifications automatically. Each toast includes:

1. A colored left border indicating the message type (success, alert, info, etc.)
2. The flash message content
3. A progress bar that indicates how much time is left before the toast disappears

The toast appears with a slide-in animation, stays visible for the configured duration, and then slides out automatically

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/example/faw_toast.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
