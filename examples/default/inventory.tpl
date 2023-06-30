%{ for host in hosts ~}
${host} ansible_user=root
%{ endfor ~}
