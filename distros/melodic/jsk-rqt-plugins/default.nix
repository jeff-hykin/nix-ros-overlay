
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, image-publisher, image-view2, jsk-gui-msgs, message-generation, message-runtime, mk, pythonPackages, qt-gui-py-common, resource-retriever, rosbuild, roslaunch, rostest, rqt-gui, rqt-gui-py, rqt-image-view, rqt-plot }:
buildRosPackage {
  pname = "ros-melodic-jsk-rqt-plugins";
  version = "2.1.8-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "tork-a";
        repo = "jsk_visualization-release";
        rev = "release/melodic/jsk_rqt_plugins/2.1.8-1";
        sha256 = "sha256-CyitFiHgdQvs/1AuJOGmqMgdT/xslOtKZGGnqmbTK/s=";
      };

  buildType = "catkin";
  buildInputs = [ catkin message-generation mk rosbuild ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ cv-bridge image-publisher image-view2 jsk-gui-msgs message-runtime pythonPackages.scikitlearn pythonPackages.urlgrabber qt-gui-py-common resource-retriever rqt-gui rqt-gui-py rqt-image-view rqt-plot ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The jsk_rqt_plugins package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
