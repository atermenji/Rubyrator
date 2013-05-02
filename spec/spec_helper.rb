require 'rubyrator'

class SimpleDecorator
  extend Rubyrator

  def bold(dec_args, orig, *args, &block)
    "<b>" + orig.call(*args, &block) + "</b>"
  end

  def italic(dec_args, orig, *args, &block)
    "<i>" + orig.call(*args, &block) + "</i>"
  end

  decorate :bold 
  decorate :italic
  def text_double_decorated(text)
    text
  end

  def text_not_decorated(text)
    text
  end

  decorate :bold 
  def text_single_decorated(text)
    text
  end

  decorate :bold
  def self.text_class_method(text)
    text
  end

  private

  decorate :bold
  def text_private(text)
    text
  end

end

class ArgumentsDecorator
  extend Rubyrator

  def single_arg_decorator(dec_args, orig, *args, &block)
    retry_num = dec_args[0]
    result = 0

    retry_num.times do 
      result += orig.call(*args, &block)
    end

    return result
  end

  def multiple_arg_decorator(dec_args, orig, *args, &block)
    orig.call(*args, &block) + dec_args[0] + dec_args[1] + dec_args[2]
  end

  decorate :single_arg_decorator, 3
  def number(number)
    number
  end

  decorate :multiple_arg_decorator, 1, 2, 3
  def number2(number)
    number
  end

end