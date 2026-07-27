
#!/bin/bash
yum install git -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "Hello, World!" > /var/www/html/index.html