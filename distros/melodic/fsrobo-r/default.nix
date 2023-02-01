
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, fsrobo-r-bringup, fsrobo-r-description, fsrobo-r-driver, fsrobo-r-moveit-config, fsrobo-r-msgs, fsrobo-r-trajectory-filters }:
buildRosPackage {
  pname = "ros-melodic-fsrobo-r";
  version = "0.7.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fsrobo_r-release";
    rev = "308de45fca4b909265920f7f2b834a44ce805d4f";
    owner = "FUJISOFT-Robotics";
    sha256 = "sha256-v342iXkrRROt6MMSy8a5Lw0hjz+2xn9fF3pQj9eF8DA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ fsrobo-r-bringup fsrobo-r-description fsrobo-r-driver fsrobo-r-moveit-config fsrobo-r-msgs fsrobo-r-trajectory-filters ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Meta package for FSRobo-R'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
