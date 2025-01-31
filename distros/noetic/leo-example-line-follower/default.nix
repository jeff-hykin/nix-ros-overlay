
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, dynamic-reconfigure, geometry-msgs, rospy, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-leo-example-line-follower";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "leo_examples-release";
    rev = "98d6617abe65d2abce21b0234d1c35841af670d8";
    owner = "fictionlab-gbp";
    sha256 = "sha256-ui4ZY8Qw4EsglilTTGEYb8PWIabqPkoWwU3EloMbSBs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge dynamic-reconfigure geometry-msgs rospy sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A neural Network model for line track following Example for Leo Rover.'';
    license = with lib.licenses; [ mit ];
  };
}
