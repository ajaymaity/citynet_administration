Citynet production configuration
==

Installation
--
Follow guide in
` install_procedure.txt `


Update the production server
--

**TODO: setup prod branch and auto deploy with gitlab CI**

Manual instructions:
* Connect to the server
```bash
./connect.sh
```
* Stop the current server
```bash
tmux a
CTRL+C  # to stop the server
CTRL+D # to quit the docker
```
*Update git
```bash
git fetch --all
git reset --hard origin/master
```
*restart the server ***The ugly way to be fixed***
```bash
sudo docker/prod_run_docker.sh
prod/start_prod.sh
```
*detach the tmux and disconnect from the server
```bash
CTRL+B, D
CTRL+D
```