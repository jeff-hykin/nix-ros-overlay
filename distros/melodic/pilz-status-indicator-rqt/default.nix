
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pilz-msgs, pythonPackages, rospy, rostest, rosunit, rqt-gui, rqt-gui-py, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-pilz-status-indicator-rqt";
  version = "0.5.23-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pilz_robots-release";
    rev = "3cfa7493f90c778713f71193ed6e68018c17a3fd";
    owner = "PilzDE";
    sha256 = "sha256-2Fs6ThSiMz4dcc8zubrCMbl8tl69E5AgHskNw88OQVY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ pythonPackages.mock rostest rosunit ];
  propagatedBuildInputs = [ pilz-msgs rospy rqt-gui rqt-gui-py std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Showing information about operation mode, status and speed override of the robot.'';
    license = with lib.licenses; [ asl20 ];
  };
}
