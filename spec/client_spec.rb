require 'spec_helper'

base_url = 'http://localhost:6969'

describe FractaljsRails::Client do
  describe "#pool" do
    it "returns faraday connection" do
      client = FractaljsRails::Client.new(base_url: base_url)
      expect(client.send(:conn)).to be_a Faraday::Connection
    end

    it "sets base_url of faraday conn" do
      client = FractaljsRails::Client.new(base_url: base_url)
      expect(client.instance_variable_get('@base_url')).to eq(base_url)
    end
  end
end
