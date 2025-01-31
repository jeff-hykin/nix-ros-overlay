
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, marker-msgs, mrpt-msgs, mrpt2, ros-environment, roscpp, tf2 }:
buildRosPackage {
  pname = "ros-melodic-mrpt-msgs-bridge";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrpt_navigation-release";
    rev = "80d605a917ccd3688e306b75c71620844b2021cf";
    owner = "mrpt-ros-pkg-release";
    sha256 = "sha256-dVjKauDC+Ln4glEsjm6Ecq5I6DjaKqn+Lavuj+rh7F4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ros-environment ];
  propagatedBuildInputs = [ geometry-msgs marker-msgs mrpt-msgs mrpt2 roscpp tf2 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''C++ library to convert between custom mrpt_msgs messages and native MRPT classes'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
