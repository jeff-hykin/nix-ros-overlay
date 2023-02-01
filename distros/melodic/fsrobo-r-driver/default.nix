
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, fsrobo-r-msgs, industrial-robot-client, roslaunch, rostest, urdf }:
buildRosPackage {
  pname = "ros-melodic-fsrobo-r-driver";
  version = "0.7.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fsrobo_r-release";
    rev = "fb8a64674c25a4517d432dbf36423c06d5cccf01";
    owner = "FUJISOFT-Robotics";
    sha256 = "sha256-Z6HBsu50Xl5EpR6qE3coyqK8hDqAfrD7pUyliRlJH2A=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ fsrobo-r-msgs industrial-robot-client urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The fsrobo_r_driver package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
