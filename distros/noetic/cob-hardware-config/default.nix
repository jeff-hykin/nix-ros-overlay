
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-calibration-data, cob-description, cob-omni-drive-controller, cob-supported-robots, costmap-2d, diagnostic-aggregator, joint-state-controller, joint-state-publisher, joint-state-publisher-gui, joint-trajectory-controller, laser-filters, position-controllers, raw-description, robot-state-publisher, roslaunch, rostest, rviz, velocity-controllers, xacro }:
buildRosPackage {
  pname = "ros-noetic-cob-hardware-config";
  version = "0.7.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_robots-release";
    rev = "f5892f7fcd1e7bff27d481164c0fc13de9f63683";
    owner = "ipa320";
    sha256 = "sha256-3Psazx33JvzXf34TRClZ2O4ACP0s8dc1ia7BgAS919E=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ cob-supported-robots roslaunch rostest ];
  propagatedBuildInputs = [ cob-calibration-data cob-description cob-omni-drive-controller costmap-2d diagnostic-aggregator joint-state-controller joint-state-publisher joint-state-publisher-gui joint-trajectory-controller laser-filters position-controllers raw-description robot-state-publisher rviz velocity-controllers xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains configuration for each robot instance (e.g. cob4-X, raw3-X). There is a directory for each robot with configuration about urdf and hardware/device configurations.'';
    license = with lib.licenses; [ asl20 ];
  };
}
