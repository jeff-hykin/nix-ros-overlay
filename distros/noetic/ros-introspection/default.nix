
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages, roslint, rosmsg }:
buildRosPackage {
  pname = "ros-noetic-ros-introspection";
  version = "1.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roscompile-release";
    rev = "8069511f361693162c1c76f7613869a572503c45";
    owner = "wu-robotics";
    sha256 = "sha256-9ytXGNds/guHnN2+qEvZi8TaE4Va58o8rV1/rEJ1eKQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint ];
  propagatedBuildInputs = [ python3Packages.pyyaml python3Packages.requests python3Packages.rospkg rosmsg ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The ros_introspection package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
