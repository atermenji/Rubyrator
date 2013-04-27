module Rubyrator 

  def decorate(decorator, *decorator_args)
    m_decorator = instance_method(decorator)
    meth_added = method(:method_added)

    define_singleton_method(:method_added) do |name|
      to_decorate = instance_method(name)
      define_singleton_method(:method_added, &meth_added)
      
      define_method(name) do |*args, &block|
        m_decorator.bind(self).call(decorator_args, to_decorate.bind(self), *args, &block)
      end
    end
  end 

end