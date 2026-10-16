# Setup notes

## VM
- VirtualBox, VM name: Ubuntu-Server-Lab
- 1 vCPU, 2048 MB RAM, 25 GB dynamically allocated disk
- Ubuntu Server (no GUI), manual installation, OpenSSH server enabled
- Network: NAT, port forwarding host 127.0.0.1:2222 -> guest 22

## Hardening steps
1. UFW: default deny incoming, allow outgoing, allow 22/tcp (see ufw-rules.txt)
2. SSH key pair (ed25519) created on the host, public key added to authorized_keys
3. Password and root login disabled via sshd_config.d (see sshd-hardening.conf)
4. fail2ban enabled for the sshd jail

## Automation
- Cron jobs are listed in crontab.txt
- Scripts always use full paths and redirect output to log files
