# Rubyrator

Python like method decorators for Ruby.

## Installation
`gem install rubyrator`

## Usage

Extend Rubyrator in a class where you want to use it, and then stick `decorate :decorator_method_name` before your method declaration to decorate the method.

You can set multiple decorators for your methods. 

```ruby
class Html
  extend Rubyrator

  def bold(dec_args, orig, *args, &block)
    "<b>" + orig.call(*args, &block) + "</b>"
  end

  def italic(dec_args, orig, *args, &block)
    "<i>" + orig.call(*args, &block) + "</i>"
  end

  decorate :bold 
  decorate :italic
  def text(text)
    text
  end
end

puts Html.new.text("decorate me please") # => "<b><i>decorate me please</i></b>"
```

You can add parameters to your decorator methods. Just pass them after a decorator method name, separated by the comma.

```ruby
class Spamer
  extend Rubyrator

  def retry(dec_args, orig, *args, &block)
    retry_num = dec_args[0]
    retry_num.times do 
      orig.call(*args, &block)
    end
  end

  decorate :retry, 3
  def spam(spam_message)
    print spam_message
  end
end

Spamer.new.spam("spam") # => "spamspamspam"
```

## License

Released under the MIT License.  See the [LICENSE][] file for further details.

[license]: LICENSE

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/atermenji/rubyrator/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

