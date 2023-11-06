%{ for index, host in hosts ~}
Host cloudtop-${index + 1}
  HostName ${host}
  # User root
  ControlMaster auto
  ControlPath ~/.ssh/control-%h-%p-%r

%{ endfor ~}
