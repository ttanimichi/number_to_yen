# number_to_yen

[![Build Status](https://travis-ci.org/ttanimichi/number_to_yen.svg?branch=master)](https://travis-ci.org/ttanimichi/number_to_yen)
[![Gem Version](https://badge.fury.io/rb/number_to_yen.svg)](http://badge.fury.io/rb/number_to_yen)

数値を日本円の表記（例:  12万3,456円）の文字列にフォーマットする helper です。
Active Support の [number_to_currency](http://api.rubyonrails.org/v5.1.0/classes/ActiveSupport/NumberHelper.html#method-i-number_to_currency) に強く影響を受けています。

```bash
$ gem install number_to_yen
```

```ruby
require 'number_to_yen'
include NumberToYen

number_to_yen(1234)       # => "1,234円"
number_to_yen(123456)     # => "12万3,456円"
number_to_yen(123456.0)   # => "12万3,456円"
number_to_yen(1234567890) # => "12億3,456万7,890円"
```

4 桁区切りで 0 が 4 つ続く場合、日本語の慣習に倣ってそれらの桁は省略されます。

```ruby
number_to_yen(120000)     # => "12万円"
number_to_yen(1234560000) # => "12億3,456万円"
number_to_yen(1200007890) # => "12億7,890円" 
number_to_yen(1200000000) # => "12億円" 
```

## Ruby on Rails の場合

Gemfile に

```ruby
gem 'number_to_yen'
```

を追記して `bundle install` してください。include などは不要です。View の helper に `number_to_yen` が追加されます。

```erb
<%= number_to_yen(123456) %> # => "12万3,456円"
```

## コア拡張を使う場合

Gemfile に次のように指定すると、Integer や Float にインスタンスメソッド `to_yen` が生えます。

```ruby
gem 'number_to_yen', require: 'number_to_yen/core_ext'
```

```ruby
1234.to_yen       # => "1,234円"
123456.to_yen     # => "12万3,456円"
123456.0.to_yen   # => "12万3,456円"
1234567890.to_yen # => "12億3,456万7,890円"
```

より簡潔に書けて便利ですが、helper の `number_to_yen` とコア拡張の `to_yen` どちらを使うかは個別に判断してください。

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ttanimichi/number_to_yen

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
