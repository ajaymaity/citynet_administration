Citynet production configuration
==

Clonning the repository
--
You need to clone this repository in the same parent folder as citynet.
You also need to name it `config_private_citynet`:
```
git clone git@gitlab.com:aseproject11/config_private.git config_private_citynet
```

Installation
--
Follow guide in
` install_procedure.txt `


Update the production server
--

**TODO: setup prod branch and auto deploy with gitlab CI**

Manual instructions:
* Connect to the server
```
./connect.sh
```
* Stop the current server
```
tmux a
CTRL+C  # to stop the server
CTRL+D # to quit the docker
```
*Update git
```
git fetch --all
git reset --hard origin/master
```
*restart the server ***The ugly way to be fixed***
```
sudo docker/prod_run_docker.sh
prod/start_prod.sh
```
*detach the tmux and disconnect from the server
```
CTRL+B, D
CTRL+D
```