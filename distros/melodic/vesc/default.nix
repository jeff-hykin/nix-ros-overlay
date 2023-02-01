
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, vesc-ackermann, vesc-driver, vesc-msgs }:
buildRosPackage {
  pname = "ros-melodic-vesc";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "vesc-release";
    rev = "9c2755ae138e9d1986050f6766393c002314ba39";
    owner = "f1tenth";
    sha256 = "sha256-Um+eGDzsSU4sbpvCELsRxLP8x/VO3I9UZ4lVpFjb1gw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ vesc-ackermann vesc-driver vesc-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage for ROS interface to the Vedder VESC open source motor controller.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
