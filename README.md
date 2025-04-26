# FawToast

A simple, configurable toast notification system for Rails applications. FawToast provides an easy way to display flash messages as toast notifications with minimal setup.

## Features

- Easy integration with Rails 7+ applications
- CSS-only animations
- Configurable toast duration and position
- Customizable CSS classes for different flash types
- Support for standard flash types plus additional success and info types
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
3. Import the required stylesheet and JavaScript controller

## Usage

FawToast works with Rails flash messages. You can use it like this:

```ruby
# In your controller
def create
  # Your logic here
  flash[:success] = "Item was successfully created!"
  redirect_to items_path
end
```

FawToast supports the following flash types out of the box:
- `:success` - Green border
- `:alert` - Red border
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
    success: 'border-l-10 border-green-500',
    alert: 'border-l-10 border-red-500',
    info: 'border-l-10 border-sky-600',
    notice: 'border-l-10 border-sky-600',
    default: 'border-l-10 border-indigo-500'
  }
end
```

## How It Works

FawToast uses CSS animations to show and hide toast notifications automatically. Each toast includes:

1. A colored left border indicating the message type (success, alert, info, etc.)
2. The flash message content
3. A progress bar that indicates how much time is left before the toast disappears

The toast appears with a slide-in animation, stays visible for the configured duration, and then slides out automatically. No JavaScript interaction is required for the basic functionality.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/example/faw_toast.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
