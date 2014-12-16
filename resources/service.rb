actions :start, :stop, :create
default_action :create

attribute :service_name, :kind_of => String, :name_attribute => true

attribute :pid_file, :kind_of => String
attribute :start_command, :kind_of => String
attribute :stop_command, :kind_of => String
attribute :group_name, :kind_of => String
attribute :memory_limit, :kind_of => String

