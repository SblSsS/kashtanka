# KASHTANKA

Simple CMS on Ruby on Rails.

## Installation

```
Ruby  2.1.4
Rails 4.0.2
```

```bash
bundle install
rake db:setup
```

## Settings

You can easily configurate your application by editing the initializer ```kashtanka.rb```:

```ruby
Core.configure do |config|
    ...
	config.setting_name = setting_value
	...
end
```

If you want to add more settings you can do it at ```lib/core.rb```:

```ruby
	# Just set new preference with set_pref method

	set_pref setting_name, options_hash

	# You can provide the following options as a hash:
	# db: boolean (save it to database and edit via admin panel)
	# default: value (setting default value)
	# parser: "BooleanParser" (setting type parser, string by default)
```

### Parsers

You can use and add parsers that are in ```lib/core/parsers```.

