
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, pythonPackages, roslib, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-inorbit-republisher";
  version = "0.2.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_inorbit_samples-release";
    rev = "95f999afcab28a2e226e9cdd5ada10e3764be346";
    owner = "inorbit-ai";
    sha256 = "sha256-Bv0QQ3O6DuPCm+5E4cCDRiU+Wc4GuVMtS/BCP879aYk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs pythonPackages.pyyaml pythonPackages.rospkg roslib rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS to InOrbit topic republisher'';
    license = with lib.licenses; [ mit ];
  };
}
