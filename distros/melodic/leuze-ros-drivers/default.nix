
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, leuze-bringup, leuze-description, leuze-msgs, leuze-phidget-driver, leuze-rsl-driver }:
buildRosPackage {
  pname = "ros-melodic-leuze-ros-drivers";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "leuze_ros_drivers-release";
    rev = "0aa26c66201619b6cda0c4654491fc321999b4a2";
    owner = "ipa-led";
    sha256 = "sha256-skrC3awiEfWbk4s6lD8HqmyZ+buYmW4mkCTjA6Y/UJ4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ leuze-bringup leuze-description leuze-msgs leuze-phidget-driver leuze-rsl-driver ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The leuze_ros_drivers metapackage'';
    license = with lib.licenses; [ asl20 ];
  };
}
