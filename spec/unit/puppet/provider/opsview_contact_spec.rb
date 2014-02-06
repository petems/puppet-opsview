#!/usr/bin/env rspec

require 'spec_helper'
if Puppet.version < '3.4.0'
  require 'puppet/provider/confine/exists'
else
  require 'puppet/confine/exists'
end

opsview_contact = Puppet::Type.type(:opsview_contact)

describe opsview_contact do

  before :each do
    @class = opsview_contact
    @provider = double 'provider'
    
    @resource = @class.new({:name  => 'foobar', :fullname => 'Foo Bar'})

    # Stub confine facts
    allow(Facter.fact(:kernel)).to receive(:value).and_return('Linux')
    allow(Facter.fact(:operatingsystem)).to receive(:value).and_return('Debian')
  end

  it "should default to ProviderOpsview" do   
    resource = Puppet::Type.type(:opsview_contact).new({
      :name => 'Mr Johnson',
    })

    expect(resource.provider.class.to_s).to eq("Puppet::Type::Opsview_contact::ProviderOpsview")
  end

  it 'should not accept a name with non-ASCII chars' do
    lambda { @resource[:fullname] = '%*#^(#$' }.should raise_error(Puppet::Error)
  end
end