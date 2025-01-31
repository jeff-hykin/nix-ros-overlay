
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, geometry-msgs, interactive-markers, message-generation, message-runtime, qt-gui-py-common, rospy, rqt-gui, rqt-gui-py, std-msgs, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-frame-editor";
  version = "1.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_frame_editor_plugin-release";
    rev = "5fdba94baaf04b9834d5bfc2b43a8445e964aefc";
    owner = "ipa320";
    sha256 = "sha256-MjBvlL4aX4lEJuRGkwsH9f/OzkvduiSF8ye2Dv0i/Xk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ dynamic-reconfigure geometry-msgs interactive-markers message-runtime qt-gui-py-common rospy rqt-gui rqt-gui-py std-msgs tf visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The frame_editor package'';
    license = with lib.licenses; [ mit ];
  };
}
