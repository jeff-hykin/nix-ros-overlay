
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-jsk-gui-msgs";
  version = "4.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_common_msgs-release";
    rev = "a12b2e6b2e3d39c56eea5aa53661c9ac40cbe503";
    owner = "tork-a";
    sha256 = "sha256-jYSWz9D3lYZkmWoOerYObURtoYmJoJhU90uu2yhCiFw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''jsk_gui_msgs'';
    license = with lib.licenses; [ asl20 ];
  };
}
