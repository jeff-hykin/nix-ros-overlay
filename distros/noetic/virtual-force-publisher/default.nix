
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, kdl-parser, sensor-msgs, tf-conversions, urdf }:
buildRosPackage {
  pname = "ros-noetic-virtual-force-publisher";
  version = "2.2.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_common-release";
    rev = "70460dbeaf34ae7edb5d184047b4219ca1e405e4";
    owner = "tork-a";
    sha256 = "sha256-dG82XAJu9RwjPifnBPv4urgsJdnqiQd1UCWssNU5oXY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs kdl-parser sensor-msgs tf-conversions urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''publish end effector's force, which is estmated from joint torque value'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
