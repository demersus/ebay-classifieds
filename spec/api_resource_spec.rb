require 'spec_helper'

class DummyClass
end

class DummyClass2
end

describe 'EbayClassifieds::ApiResource' do
  context "When included in a class" do
    let!(:klass) do
      c = DummyClass
      c.send(:include, EbayClassifieds::ApiResource)
      c.api_path('/api_path')
      c.api_format(:api_format)
      c
    end
    describe ".api_path_join" do
      let(:additional_path) { '/additional/path' }
      let(:parameters) { {:param1 => 'param1-value', :param2 => 'param2-value'} }
      
      context "when given no arguments" do
        subject { klass.api_path_join }
        it { should == "/api_path.api_format" }
      end
      context "when given a string of additional/path" do
        subject { klass.api_path_join(additional_path) }
        it { should == "/api_path/additional/path.api_format" }
      end
      context "when given a hash of parameters" do
        subject { klass.api_path_join(parameters) }
        it { should == "/api_path.api_format?param1=param1-value&param2=param2-value" }
      end
      context "when given both a string of additional/path and a hash of parameters" do
        subject { klass.api_path_join(additional_path,parameters) }
        it { should == "/api_path/additional/path.api_format?param1=param1-value&param2=param2-value" }
      end
    end
  end
  context "When included in multiple classes" do
    before do
      @klass1 = DummyClass
      @klass1.send(:include, EbayClassifieds::ApiResource)
      @klass2 = DummyClass2
      @klass2.send(:include, EbayClassifieds::ApiResource)
    end
    
    describe ".api_path" do
      it "should only set the api_path in one class" do
        @klass1.api_path('/fu')
        @klass2.api_path.should_not == @klass1.api_path
      end
    end
    describe ".api_format" do
      it "should only set the api_format in one class" do
        @klass1.api_format(:format1)
        @klass2.api_format.should_not == @klass1.api_format
      end
    end
    
  end
end
