#!/usr/bin/env rspec

require 'spec_helper'

opsview_contact = Puppet::Type.type(:opsview_contact)

describe opsview_contact do
  before :each do
    @class = opsview_contact
    @provider = double 'provider'
    @resource = @class.new({:name  => 'mr-foo-bar'})

    #Some basic sane default facts...
    allow(Facter.fact(:kernel)).to receive(:value).and_return('Linux')
    allow(Facter.fact(:operatingsystem)).to receive(:value).and_return('Debian')
  end

  it 'should have :name be its namevar' do
    @class.key_attributes.should == [:name]
  end

  describe ':name' do
    it 'should accept a name' do
      @resource[:name] = 'mr-foo-bar'
      @resource[:name].should == 'mr-foo-bar'
    end
  end

  describe ':fullname' do
    it "should have no default" do
      res = @class.new(:name => "mr-foo-bar")
      res.parameters[:fullname].should == nil
    end
  end

  describe ':reload_opsview' do
    it "should have no default" do
      res = @class.new(:name => "mr-foo-bar")
      res.parameters[:reload_opsview].should == nil
    end
  end

  describe ':role' do
    it "should have no default" do
      res = @class.new(:name => "mr-foo-bar")
      res.parameters[:role].should == nil
    end
  end

  describe ':encrypted_password' do
    it "should have no default" do
      res = @class.new(:name => "mr-foo-bar")
      res.parameters[:encrypted_password].should == nil
    end
  end

  describe ':language' do
    it "should have no default" do
      res = @class.new(:name => "mr-foo-bar")
      res.parameters[:language].should == nil
    end
  end

end