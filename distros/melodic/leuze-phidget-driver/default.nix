
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, leuze-msgs, roscpp, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-leuze-phidget-driver";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "leuze_ros_drivers-release";
    rev = "62326f6039da61bdcb4ea5c3e28e739aba9fdb3a";
    owner = "ipa-led";
    sha256 = "sha256-PHS/mScTa5E8V+pwrPeqJUBbol/wdWmjxttGxXdiZuw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ leuze-msgs roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The phidget interface kit driver package for leuze lasers'';
    license = with lib.licenses; [ asl20 ];
  };
}
