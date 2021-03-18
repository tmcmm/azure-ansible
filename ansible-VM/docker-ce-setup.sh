#Ubuntu 18.04 Docker CE setup
#Here you set up your main machine to have Docker CE and kubectl installed.

{
# install dependencies
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

# get the Docker gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add the Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

# get the Kubernetes gpg key
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# add the Kubernetes repository
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# list available versions of kubectl in your repo
apt-cache madison kubectl | head -n 5

# check docker available versions
apt-cache madison docker-ce | head -n 5
apt-cache madison docker-ce-cli | head -n 5

# update and install packages
sudo apt update
sudo apt install docker-ce=5:20.10.5~3-0~ubuntu-bionic docker-ce-cli=5:20.10.5~3-0~ubuntu-bionic containerd.io -y

# hold them at the current version
sudo apt-mark hold docker-ce docker-ce-cli
}
