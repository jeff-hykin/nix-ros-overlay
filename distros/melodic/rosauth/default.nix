
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, openssl, roscpp, rostest }:
buildRosPackage {
  pname = "ros-melodic-rosauth";
  version = "1.0.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosauth-release";
    rev = "ce65d864c1a09327a93e206c018dd16774870641";
    owner = "gt-rail-release";
    sha256 = "sha256-k6rlgHzOtIixFOZAXYcjZimrp6cFUKE1p7MCPhzpIME=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation openssl ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ message-runtime roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Server Side tools for Authorization and Authentication of ROS Clients'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
