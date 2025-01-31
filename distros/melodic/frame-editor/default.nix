
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, geometry-msgs, interactive-markers, message-generation, message-runtime, qt-gui-py-common, rospy, rqt-gui, rqt-gui-py, std-msgs, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-frame-editor";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_frame_editor_plugin-release";
    rev = "0cff070dbbc10d9d2a606f4b02c33015e6ab165d";
    owner = "ipa320";
    sha256 = "sha256-qDs5a96KG7MXcFyrmHPm3TNXCp2bGmMxuwCiJgXfsjM=";
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
