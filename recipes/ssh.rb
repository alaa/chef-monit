include_recipe "chef_monit::default"

chef_monit_service "ssh" do
  action [:create, :start]
  start_command "/usr/sbin/service ssh start"
  stop_command "/usr/sbin/service ssh stop"
  pid_file "/tmp/sshd.pid"
  group_name "ssh"
  memory_limit "100 MB"
end

