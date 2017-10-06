#!/bin/bash

# Add my user
useradd -m -s /bin/bash bart
mkdir /home/bart/.ssh
chown bart:bart /home/bart/.ssh
touch /home/bart/.ssh/authorized_keys
touch /home/ubuntu/.ssh/authorized_keys
cat > /home/bart/.ssh/authorized_keys <<EOF
ssh-rsa key-goes-here bart@home
EOF
cat > /home/bart/.ssh/authorized_keys<<EOF
ssh-rsa key-goes-here bartosz.dc
EOF
cat > /home/ubuntu/.ssh/authorized_keys<<EOF
ssh-rsa key-goes-here bart@home
EOF
cat > /home/ubuntu/.ssh/authorized_keys<<EOF
ssh-rsa key-goes-here bartosz.dc
EOF

chown bart:bart /home/bart/.ssh/authorized_keys
chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys

# Allow passwordless privilege escalation

cat > /etc/sudoers.d/bart <<EOF
bart ALL=(ALL) NOPASSWD:ALL
EOF

# Update the timezone
echo Europe/London > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

#setup console password
/usr/bin/passwd bart <<EOF
console-password-goes-here
console-password-goes-here
EOF

# DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Update the package repos
apt-get update
