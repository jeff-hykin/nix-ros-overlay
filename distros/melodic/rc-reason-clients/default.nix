
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ddynamic-reconfigure-python, message-runtime, pythonPackages, rc-reason-msgs, rospy }:
buildRosPackage {
  pname = "ros-melodic-rc-reason-clients";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rc_reason_clients_ros-release";
    rev = "e7c357b30c029075799e9117641a9bc068212cbe";
    owner = "roboception-gbp";
    sha256 = "sha256-Xi3fJ4LQil6Zd0rsZ1cuocX4lrcmUJkhaShsNL+zYII=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ddynamic-reconfigure-python message-runtime pythonPackages.requests rc-reason-msgs rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Clients for interfacing with Roboception reason modules on rc_visard and rc_cube.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
