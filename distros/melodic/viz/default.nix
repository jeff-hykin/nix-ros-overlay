
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ros-base, rqt-common-plugins, rqt-robot-plugins, rviz }:
buildRosPackage {
  pname = "ros-melodic-viz";
  version = "1.4.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "metapackages-release";
    rev = "9323e15c29c99cf2013b86147d9819f7496761b7";
    owner = "ros-gbp";
    sha256 = "sha256-vFyc+W6pF5nSt2YsWwV7SJlAaoWkyzsa0jmTGmMV76k=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ros-base rqt-common-plugins rqt-robot-plugins rviz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A metapackage to aggregate several packages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
