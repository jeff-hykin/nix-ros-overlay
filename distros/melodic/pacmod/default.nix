
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, can-msgs, catkin, pacmod-msgs, roscpp, roslint, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-pacmod";
  version = "2.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pacmod-release";
    rev = "6f41f7855ac3d751b1ac9e80be9354da323a551c";
    owner = "astuff";
    sha256 = "sha256-fKKAu6vmHGq7UX8yt7+lgX31aZoSix0R3KLz8FgUNy4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslint ];
  propagatedBuildInputs = [ can-msgs pacmod-msgs roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''AutonomouStuff PACMod driver package'';
    license = with lib.licenses; [ mit ];
  };
}
