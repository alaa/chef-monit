settings = node[:chef_monit]

package "monit" do
  action :install
end

cookbook_file "/etc/default/monit" do
  source "monit.default"
  owner "root"
  group "root"
  mode 0644
  only_if { platform?("ubuntu") || platform?("debian") }
end

directory "/etc/monit/conf.d/" do
  owner  'root'
  group 'root'
  mode 0755
  action :create
  recursive true
end

template "/etc/monit/monitrc" do
  owner "root"
  group "root"
  mode 0700
  source 'monitrc.erb'
  variables(
    :interval => settings[:interval]
  )
  notifies :reload, "service[monit]", :immediately
end

if settings['remonitor_all']
  directory "/etc/cron.d/" do
    owner  'root'
    group 'root'
    mode 0755
    action :create
  end

  file "/etc/cron.d/remonitor_all" do
    content %(*/10 * * * * root /usr/bin/monit monitor all\n)
  end
end

service "monit" do
  action [:enable, :start]
  supports [:start, :restart, :reload, :stop]
end

