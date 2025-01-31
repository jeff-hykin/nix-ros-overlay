
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dingo-msgs, dingo-viz }:
buildRosPackage {
  pname = "ros-melodic-dingo-desktop";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dingo_desktop-release";
    rev = "196e125c462251b645127910639167cd9121b93a";
    owner = "clearpath-gbp";
    sha256 = "sha256-mt70lJ4KDtvQWqnlsuB1OGuylAfInV6alQ+HoV77Li0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dingo-msgs dingo-viz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Packages for working with Dingo from a ROS desktop.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
