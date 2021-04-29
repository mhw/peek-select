# Peek::Select

Peek into any collection in your app.

Things this peek view provides:

- Present options from a collection as a select list
- Run a piece of JavaScript code when an option is selected

An example use would be to list subdomains served by an application
and switch between them when a new option is selected, as in
[Usage](#usage) below.

## Installation

Add this line to your application's Gemfile:

    gem 'peek-select'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install peek-select

## Usage

Add something like the following to your `config/initializers/peek.rb`:

```ruby
Peek.into Peek::Views::Select, \
  collection: lambda { Site.order(:subdomain).pluck(:name, :subdomain) },
  selected: lambda { |controller| controller.current_site.subdomain },
  onchange: "window.location.hostname=" \
    "window.location.hostname.replace(/^[^.]*\.?(?=mysite.com)/," \
    "this.value+'.');"
```

The options are:

- `collection` - A collection or lambda returning a collection suitable
  for passing to [options_for_select](https://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-options_for_select).
  Defaults to the empty array.
- `selected` - The value in `collection` that should be selected.
- `onchange` - JavaScript for the `<select>` element's `onchange` attribute.
- `name` - String used to generate the `<select>` element's `name` and `id`
  attributes. The value used is `peek-select-#{@name}`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
