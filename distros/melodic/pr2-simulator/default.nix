
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pr2-controller-configuration-gazebo, pr2-gazebo, pr2-gazebo-plugins }:
buildRosPackage {
  pname = "ros-melodic-pr2-simulator";
  version = "2.0.14";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_simulator-release";
    rev = "f9ffbabdb4d18d45cba5103083bab52be789723a";
    owner = "pr2-gbp";
    sha256 = "sha256-wIErbJRB+Xom7dWe+MPGQhyQCaVT4RzUBHsJiyOWlWM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pr2-controller-configuration-gazebo pr2-gazebo pr2-gazebo-plugins ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pr2_simulator package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
