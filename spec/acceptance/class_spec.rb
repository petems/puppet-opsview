require 'spec_helper_acceptance'

describe "opsview_providers class:" do
  it 'should run successfully' do
    pp = "class { 'rbenv': }
	rbenv::plugin { [ 'sstephenson/ruby-build' ]: }
	rbenv::build { '2.0.0-p353': global => true, } -> class { 'opsview': }
	rbenv::gem { 'rest-client': ruby_version   => '2.0.0-p353' }
	rbenv::gem { 'json': ruby_version   => '2.0.0-p353' }
	"

    # Run it twice and test for idempotency
    apply_manifest(pp, :catch_failures => true)
    expect(apply_manifest(pp, :catch_failures => true).exit_code).to be_zero
  end
end


