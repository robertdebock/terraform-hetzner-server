%{ for index, host in hosts ~}
cloudtop-${index + 1 } ansible_host=${host} ansible_user=root
%{ endfor ~}
