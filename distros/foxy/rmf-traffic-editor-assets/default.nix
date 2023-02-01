
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl,  }:
buildRosPackage {
  pname = "ros-foxy-rmf-traffic-editor-assets";
  version = "1.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_traffic_editor-release";
    rev = "518d194a77e1ef585dc7a54a424cfe54d413731e";
    owner = "ros2-gbp";
    sha256 = "sha256-L6xMiefljNX8Rx1gWZmOxfW/ubOD1hC+zoW+TZiAFOE=";
  };

  buildType = "ament_python";

  meta = {
    description = ''Assets for use with traffic_editor.'';
    license = with lib.licenses; [ asl20 ];
  };
}
