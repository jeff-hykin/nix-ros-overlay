
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, control-msgs, moveit-msgs, roslaunch, roslint, rospy, rostest, rqt-gui, rqt-gui-py, trajectory-msgs }:
buildRosPackage {
  pname = "ros-melodic-rqt-joint-trajectory-plot";
  version = "0.0.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_joint_trajectory_plot-release";
    rev = "1c0bfd09ae913c7ce5fc3b77660d1c1548aa0549";
    owner = "tork-a";
    sha256 = "sha256-1xK5N1zbHJu8kG3TdTAJarNHkDSGrDF8W8ij1PLz6uE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslaunch roslint rostest ];
  propagatedBuildInputs = [ control-msgs moveit-msgs rospy rqt-gui rqt-gui-py trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rqt_joint_trajectory_plot package'';
    license = with lib.licenses; [ mit ];
  };
}
