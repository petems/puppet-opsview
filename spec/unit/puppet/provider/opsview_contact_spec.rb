#!/usr/bin/env rspec

require 'spec_helper'
if Puppet.version < '3.4.0'
  require 'puppet/provider/confine/exists'
else
  require 'puppet/confine/exists'
end

describe 'opsview contact provider' do
  if Puppet.version < '3.4.0'
    let(:exists) {
      Puppet::Provider::Confine::Exists
    }
  else
    let(:exists) {
      Puppet::Confine::Exists
    }
  end

  it "should default to ProviderOpsview" do   
    resource = Puppet::Type.type(:opsview_contact).new({
      :name => 'Mr Johnson',
    })

    expect(resource.provider.class.to_s).to eq("Puppet::Type::Opsview_contact::ProviderOpsview")
  end
end