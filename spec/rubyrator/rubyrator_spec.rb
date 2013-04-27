require 'spec_helper'

describe Rubyrator do

  describe SimpleDecorator do

    before :each do
      @simple_dec = SimpleDecorator.new
    end

    it "decorates a method with multiple simple decoratos" do
      @simple_dec.text_double_decorated("test").should eql "<b><i>test</i></b>"
    end

    it "is not decorating a method after decorated method" do
      @simple_dec.text_not_decorated("test").should eql "test" 
    end

    it "decorates a method with a single decorator" do
      @simple_dec.text_single_decorated("test").should eql "<b>test</b>"
    end 

  end

  describe ArgumentsDecorator do

    before :each do
      @args_dec = ArgumentsDecorator.new
    end

    it "should receive single decorator argument" do
      @args_dec.number(3).should eql 9
    end

    it "should receive multiple decorator arguments" do
      @args_dec.number2(1).should eql 7
    end

  end

end