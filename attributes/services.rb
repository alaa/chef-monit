default[:chef_monit][:service][:ssh] = {
  :service_name => "ssh",
  :start_program => "service ssh start",
  :stop_program => "service ssh stop",
  :pid_file => "/tmp/sshd.pid",
  :group_name => "ssh",
  :memory_limit => 100,
}

