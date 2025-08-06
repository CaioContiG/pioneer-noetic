# pioneer-noetic
Para consertar o erro da key:
https://askubuntu.com/questions/1341378/invalid-signature-error-for-ros-repository-while-trying-to-do-sudo-apt-get-updat
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
sudo apt update

Erro do libusb:
https://github.com/ros-drivers/joystick_drivers/issues/113
sudo apt-get install libusb-dev

Erro tf2_sensor_msgs
Check if you are on arm64
dpkg --print-architecture
If you are in arhmf you may need to put in src (remember to git checkout noetic-devel)
git clone https://github.com/ros/geometry2.git
cd geometry2
git checkout noetic-devel
# Optionally remove packages you don't need to speed up build
cd ~/pioneer-noetic
rosdep install --from-paths src --ignore-src -r -y
catkin_make




