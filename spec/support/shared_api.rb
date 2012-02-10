
shared_examples "a GET request" do
  let(:trigger) { subject }
  
  specify "The API should receive a GET request"do 
    @api.should_receive(:call) do |env|
      env['REQUEST_METHOD'].should == 'GET'
      @api.response
    end
    trigger
  end
end
