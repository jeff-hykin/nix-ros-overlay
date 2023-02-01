
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, qt5, rosbag-storage, roscpp, rosgraph-msgs }:
buildRosPackage {
  pname = "ros-melodic-swri-console";
  version = "1.1.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "swri_console-release";
    rev = "cec06c347dc239abb4ca369c752bbcf7c19e7e2b";
    owner = "swri-robotics-gbp";
    sha256 = "sha256-oF/7iUjp8cjtvWmnqqqXSRNn636RlQM7unl7lVMNVC4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ boost qt5.qtbase rosbag-storage roscpp rosgraph-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A rosout GUI viewer developed at Southwest Research Insititute as an
     alternative to rqt_console.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
