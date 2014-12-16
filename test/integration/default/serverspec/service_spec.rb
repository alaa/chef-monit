require 'spec_helper'

describe "chef_monit::service" do

  describe file("/etc/monit/conf.d/ssh") do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match(/group /) }
    its(:content) { should match(/totalmem/) }
  end

end

