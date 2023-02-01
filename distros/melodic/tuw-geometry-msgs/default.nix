
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, roscpp, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-tuw-geometry-msgs";
  version = "0.0.13";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tuw_msgs-release";
    rev = "d1d111d57b09a2ee1ef1e2bdeb57b9f20c210e97";
    owner = "tuw-robotics";
    sha256 = "sha256-A9EpZfnYteQuVe6SeoJP/uqwmEsvvedypSRzSrmBvuQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime roscpp rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The tuw_geometry_msgs package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
