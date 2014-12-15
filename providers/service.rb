require 'chef/mixin/shell_out'
require 'chef/mixin/command'

include Chef::Mixin::ShellOut
include Chef::Mixin::Command

monit_path = "/etc/monit/conf.d/"

action :create do

  template "service" do
    owner "root"
    group "root"
    mode "644"
    source "proccess.erb"
    path ::File.join(monit_path, new_resource.service_name)
    variables(:new_resource => new_resource)
    action :create
  end

  run_command(:command => "/usr/bin/monit reload")
end

action :start do
  execute "sleep 1; monit start #{new_resource.service_name}" do
    user "root"
  end
end

action :stop do
  execute "monit stop #{new_resource.service_name}" do
    user "root"
  end
end

