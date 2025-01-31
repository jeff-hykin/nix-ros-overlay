
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-manager, joint-state-controller, joint-trajectory-controller, minas-control, position-controllers, robot-state-publisher, roslaunch, rostest, tf, tra1-description, tra1-moveit-config }:
buildRosPackage {
  pname = "ros-melodic-tra1-bringup";
  version = "1.0.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "minas-release";
    rev = "0225064e11ef911d4acc23e1a9d874e9c393c9bc";
    owner = "tork-a";
    sha256 = "sha256-t6ay/ufQCW6G8gpN+5Y975gRossCpClwz/PuKVKCy04=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ controller-manager joint-state-controller joint-trajectory-controller minas-control position-controllers robot-state-publisher tf tra1-description tra1-moveit-config ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package contains bringup scripts/config/tools for tra1 robto'';
    license = with lib.licenses; [ "GPL-2.0-only" ];
  };
}
