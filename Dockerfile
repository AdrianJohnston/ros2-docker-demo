FROM ros:foxy-ros-base-focal


SHELL ["/bin/bash", "-c"]

WORKDIR /opt
RUN git clone https://github.com/ros2/demos.git
WORKDIR demos
RUN colcon build --symlink-install --packages-select demo_nodes_py
# RUN echo 'source /opt/demos/install/setup.bash' >> ~/.bashrc  


ADD . /workspace/
WORKDIR /workspace

COPY ./entrypoint.sh /


ENTRYPOINT ["/entrypoint.sh"]
