module Rubyrator 

  def decorate(decorator, *decorator_args)
    decorate_class_method(decorator, *decorator_args)
    decorate_instance_method(decorator, *decorator_args)
  end 

  private

  def decorate_class_method(decorator, *decorator_args)
    m_decorator = instance_method(decorator)

    define_singleton_method(:singleton_method_added) do |name|
      if name.to_sym != :method_added && name.to_sym != :singleton_method_added
        class << self
          remove_method :singleton_method_added
        end

        to_decorate = method(name)
        define_singleton_method(name) do |*args, &block|
          m_decorator.bind(self.new).call(decorator_args, to_decorate, *args, &block)
        end
      end
    end
  end

  def decorate_instance_method(decorator, *decorator_args)
    m_decorator = instance_method(decorator)
    meth_added = method(:method_added)

    define_singleton_method(:method_added) do |name|
      to_decorate = instance_method(name)
      define_singleton_method(:method_added, &meth_added)

      if private_method_defined?(name); visibility = :private 
      elsif protected_method_defined?(name); visibility = :protected
      else visibility = :public
      end 
      
      define_method(name) do |*args, &block|
        m_decorator.bind(self).call(decorator_args, to_decorate.bind(self), *args, &block)
      end

      case visibility
      when :protected; protected name
      when :private; private name
      end
    end
  end

end