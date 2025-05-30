# Redpanda: 
stable: 

# Installation
https://docs.redpanda.com/current/deploy/deployment-option/self-hosted/manual/production/dev-deployment/


sudo systemctl start redpanda
sudo systemctl status redpanda

# Switch to production mode for best performance:
sudo rpk redpanda mode production
sudo rpk tune all

# Install Redpanda Console
sudo apt-get install redpanda-console
sudo systemctl start redpanda-console