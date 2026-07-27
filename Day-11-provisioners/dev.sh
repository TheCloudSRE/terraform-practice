
#!/bin/bash
sudo apt update -y
sudo apt install git -y
sudo apt install apache2 -y
sudo systemctl start apache2        

# Create this file directly using bash prompt or it will take cariiage return (\r) 
# error and ^M characters if copied from windows