require 'spec_helper'

class DummyClass
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
end
