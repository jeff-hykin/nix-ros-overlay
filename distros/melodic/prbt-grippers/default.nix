
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, prbt-pg70-support }:
buildRosPackage {
  pname = "ros-melodic-prbt-grippers";
  version = "0.0.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "prbt_grippers-release";
    rev = "28f612b5960eba3e491bc32ec85a837c4280de7f";
    owner = "PilzDE";
    sha256 = "sha256-99AeTc1nkvQsCHDW4CAGiUUD6w1yRj9qvUuh2mg58dE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ prbt-pg70-support ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The package provides gripper support for the pilz_robots package.'';
    license = with lib.licenses; [ asl20 ];
  };
}
