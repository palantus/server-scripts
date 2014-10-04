sudo iptables -t nat -I PREROUTING --source 0/0 --destination 0/0 -p tcp --dport 80 -j REDIRECT --to-port 3000
sudo iptables -t nat -I PREROUTING --source 0/0 --destination 0/0 -p tcp --dport 443 -j REDIRECT --to-port 3001
#sudo iptables -t nat -I PREROUTING --source 0/0 --destination 0/0 -p tcp --dport 25 -j REDIRECT --to-port 2525

#To list all routes:
sudo iptables -t nat --line-numbers -L

#To delete a specific line number:
#sudo iptables -t nat -D PREROUTING 1
