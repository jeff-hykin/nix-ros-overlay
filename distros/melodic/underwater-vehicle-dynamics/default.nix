
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, nav-msgs, rospy, sensor-msgs, std-msgs, tf, tf-conversions }:
buildRosPackage {
  pname = "ros-melodic-underwater-vehicle-dynamics";
  version = "1.4.2-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "underwater_simulation-release";
    rev = "831716b3026f648511d59a98af30db835280788e";
    owner = "uji-ros-pkg";
    sha256 = "sha256-n9eIj2/lZMNvqrp9pJcQceeS0m1rkM5sindXZHrFEEY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rospy sensor-msgs std-msgs tf tf-conversions ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''An underwater dynamics module'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
