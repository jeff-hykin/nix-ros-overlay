
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gtest, xacro }:
buildRosPackage {
  pname = "ros-noetic-schunk-description";
  version = "0.6.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "schunk_modular_robotics-release";
    rev = "f7ee9043cb59067048c4c4e3e1058103a4ddb79e";
    owner = "ipa320";
    sha256 = "sha256-MPm9rEUUfG8qh+5ypZoBVfwFsPxdjq1cCcga2Pvc9Ds=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains the description (mechanical, kinematic, visual,
  etc.) of different schunk components. The files in this package are parsed and used by
  a variety of other components. Most users will not interact directly
  with this package.'';
    license = with lib.licenses; [ asl20 ];
  };
}
