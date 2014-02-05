require 'spec_helper_acceptance'

describe "opsview_providers class:" do
  it 'should run successfully' do
    pp = "class { 'opsview': }"

    # Run it twice and test for idempotency
    apply_manifest(pp, :catch_failures => true)
    expect(apply_manifest(pp, :catch_failures => true).exit_code).to be_zero
  end
end
