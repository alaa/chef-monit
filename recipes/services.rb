include_recipe "chef_monit::default"

settings = node[:chef_monit][:service]

settings.each do |service, value|
  service_config = settings[service.to_sym]

  chef_monit_service service_config[:service_name] do
    action [:create, :start]
    start_command service_config[:start_program]
    stop_command service_config[:stop_program]
    pid_file service_config[:pid_file]
    group_name service_config[:group_name]
    memory_limit service_config[:memory_limit]
  end

end

