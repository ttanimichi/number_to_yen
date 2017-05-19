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

より簡潔に書けて便利ですがグローバル汚染でもあるため、helper の `number_to_yen` とコア拡張の `to_yen` どちらを使うかは個別に判断してください。

## `number_to_ja` と `Numeric#to_ja`

TODO: 記載する

## gem 'draper' と併用する場合

TODO: 記載する

## gem 'money' と併用する場合

TODO: 記載する
