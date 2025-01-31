
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, app-manager, catkin, rosbridge-server, roswww, sound-play }:
buildRosPackage {
  pname = "ros-noetic-rwt-app-chooser";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_rwt-release";
    rev = "0dca292b54c2e779f78a1ff2e4a87f934f5041c2";
    owner = "tork-a";
    sha256 = "sha256-WegCiatTcX+C3T3XC9o8gs8enU4JrtfrWn3wWqcnMG4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ app-manager rosbridge-server roswww sound-play ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The simple web frontend for app_manager'';
    license = with lib.licenses; [ mit ];
  };
}
