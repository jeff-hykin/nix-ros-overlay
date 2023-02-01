
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, iris-lama, libyamlcpp, message-filters, nav-msgs, rosbag, rosbag-storage, roscpp, std-srvs, tf, tf-conversions, tf2-geometry-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-iris-lama-ros";
  version = "1.3.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "iris_lama_ros-release";
    rev = "0624f8eb0172209483a2eb0f306712eaed72466b";
    owner = "eupedrosa";
    sha256 = "sha256-/2dF1s3byKL3ZlmRdRiLPIP1tM3LAgutMeMNKu4pvzI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs iris-lama libyamlcpp message-filters nav-msgs rosbag rosbag-storage roscpp std-srvs tf tf-conversions tf2-geometry-msgs visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS package of IRIS Localization and Mapping (LaMa).'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
