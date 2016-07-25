### create some users accounts
useradd -m -p Orion123 -s /bin/bash sasdemo1
useradd -m -p Orion123 -s /bin/bash sasdemo2
useradd -m -p Orion123 -s /bin/bash sasdemo3

### installeer de webserver nginx
apt-get update
apt-get -y install nginx

### installeer R, voeg toe aan trusted lijst
sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'

### add keys
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -

### install
apt-get update
apt-get -y install r-base

### installeer dependencies om devtools te kunnen installeren
apt-get -y install libcurl4-gnutls-dev
apt-get -y install libxml2-dev
apt-get -y install libssl-dev

#### installeer veel gebruikte R packages
su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""
su - -c "R -e \"install.packages('randomForest', repos='http://cran.rstudio.com/')\""

#### Rstudio Server
apt-get -y install libapparmor1 gdebi-core
wget https://download2.rstudio.org/rstudio-server-0.99.902-amd64.deb
gdebi rstudio-server-0.99.902-amd64.deb