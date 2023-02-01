
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, jackal-msgs, jackal-viz }:
buildRosPackage {
  pname = "ros-melodic-jackal-desktop";
  version = "0.4.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jackal_desktop-release";
    rev = "29b12ae3d42d2ee0eacd54ba9295f53e93f779d2";
    owner = "clearpath-gbp";
    sha256 = "sha256-UTbnSaowc6pL+Sbu5kMVVi1z4H1V//xVarSrKogm5zo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ jackal-msgs jackal-viz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Packages for working with Jackal from a ROS desktop.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
