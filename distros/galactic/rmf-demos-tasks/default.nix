
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, rmf-dispenser-msgs, rmf-fleet-msgs, rmf-lift-msgs, rmf-task-msgs }:
buildRosPackage {
  pname = "ros-galactic-rmf-demos-tasks";
  version = "1.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_demos-release";
    rev = "0f2c8a26484c5cb1ad0e22095e012283882fecac";
    owner = "ros2-gbp";
    sha256 = "sha256-ne9WXmXw3+hseFgkBuuHOOFTv1x8vkZOYn3Vh8IujYo=";
  };

  buildType = "ament_python";
  propagatedBuildInputs = [ rmf-dispenser-msgs rmf-fleet-msgs rmf-lift-msgs rmf-task-msgs ];

  meta = {
    description = ''A package containing scripts for demos'';
    license = with lib.licenses; [ "Apache-Licence-2.0" ];
  };
}
