require 'spec_helper'

describe "chef_monit::default" do

  describe package("monit") do
    it { should be_installed }
  end

  describe service("monit") do
    it { should be_enabled }
    it { should be_running }
  end

  describe file("/etc/default/monit") do
    it { should be_file }
  end

  describe file("/etc/monit/conf.d") do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe file('/etc/monit/monitrc') do
    it { should be_mode 700 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match(/set daemon 30/) }
  end

end

