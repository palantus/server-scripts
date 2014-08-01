sudo iptables -t nat -I PREROUTING --source 0/0 --destination 0/0 -p tcp --dport 80 -j REDIRECT --to-port 3000
sudo iptables -t nat -I PREROUTING --source 0/0 --destination 0/0 -p tcp --dport 443 -j REDIRECT --to-port 3001

#To list all routes:
sudo iptables -t nat --line-numbers -L

#To delete a specific line number:
#sudo iptables -t nat -D PREROUTING 1
