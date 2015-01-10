# KASHTANKA

Simple CMS.

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

You can easily configurate your application by editing the initializer ```kashtanka_config.rb```:

```ruby
Settings.configure do |config|
    ...
	config[:setting_name] = setting_value
	...
end
```

OR if you want your settings to be editable via admin panel you should add it in ```lib/core/config.rb```:

```ruby
...
	private

	def load_from_db
        ...
		settings << Setting.create_with(value: default_value).find_or_create_by(name: "setting_name", parser: "setting_parser_class_name").try(:id)
		...
	end
...
```

### Parsers

You can use and add parsers that are in ```lib/core/parsers```.

