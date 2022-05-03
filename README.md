# Controller

Controller for the NaoPoint project.

## Getting Started

How to run this app:

- clone the repository

- clone https://github.com/NaoPoint/TvScreen, https://github.com/NaoPoint/FlaskRequest and https://github.com/NaoPoint/Hologram

- place the repositories under C:\Xampp\htdocs\NaoPoint on your PC

- required programs: Apache (e.g. using Xampp), Python3, Choregraphe 2.8.6+, VLC, any browser (no internet required)

- required Python modules: Flask, Flask-cors/Waitress, Requests (note: requests might need to be installed into Choregraphe too using pip from Python2.7)

## Warning

This scripts only work on Windows 10 and Windows 11. The NaoPoint project is compatible with other OSes but it needs to be set up manually.

Note that during the execution of the project the primary PC will be configured to use a static IP address. DHCP is restored after a normal closure.

The project can also run on a single machine, but in case of multiple PCs they have to be connected to the same local network.
