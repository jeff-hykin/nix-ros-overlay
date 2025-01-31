
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, iris-lama, message-filters, nav-msgs, rosbag, rosbag-storage, roscpp, std-srvs, tf, tf-conversions, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-iris-lama-ros";
  version = "1.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "iris_lama_ros-release";
    rev = "f650101a9b3df7bad663e75116eaa1449d7d9c7e";
    owner = "eupedrosa";
    sha256 = "sha256-pJoxqHpdaq8ApZU7oGHs0KwmJ53yve0LfsmJAP1ftuU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs iris-lama message-filters nav-msgs rosbag rosbag-storage roscpp std-srvs tf tf-conversions visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS package of IRIS Localization and Mapping (LaMa).'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
