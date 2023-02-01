
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, qt5, rosbag, rosbag-storage, roscpp, tf, tf2-msgs }:
buildRosPackage {
  pname = "ros-melodic-rosbag-editor";
  version = "0.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag_editor-release";
    rev = "68e2f310c7f043b820ebc206a83d321713d61587";
    owner = "facontidavide";
    sha256 = "sha256-3CzFYNDWE6F29Yw3MCGuWeH2zNDSZT0TN1wUbfoVLCA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ qt5.qtbase rosbag rosbag-storage roscpp tf tf2-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rosbag_editor package'';
    license = with lib.licenses; [ mit ];
  };
}
