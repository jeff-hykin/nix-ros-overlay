
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, python, rospy, tf, tf2-ros }:
buildRosPackage {
  pname = "ros-melodic-static-tf";
  version = "0.0.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "static_tf_release";
    rev = "39366e622cd0e2424c8576d052eec75b1f0e0ab9";
    owner = "wu-robotics";
    sha256 = "sha256-f5W54xK/nY2dSjkQWeTOKOD7km8ZKja9H1sLnJKdIR0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs python rospy tf tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The static_tf package'';
    license = with lib.licenses; [ "TODO-CATKIN-PACKAGE-LICENSE" ];
  };
}
