
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosbag, roscpp, xpp-hyq, xpp-quadrotor, xpp-vis }:
buildRosPackage {
  pname = "ros-melodic-xpp-examples";
  version = "1.0.10";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "xpp-release";
    rev = "f3bc7c94a13c488712f09aa92ffea1a9e87f229c";
    owner = "leggedrobotics";
    sha256 = "sha256-PpyjBX1+7MvPo3hOUsOdgnSi84MgcGAJYxkUIHyIfsA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rosbag roscpp xpp-hyq xpp-quadrotor xpp-vis ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Examples of how to use the xpp framework.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
