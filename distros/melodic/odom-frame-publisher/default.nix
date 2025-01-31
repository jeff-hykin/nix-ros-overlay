
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, geometry-msgs, quaternion-operation, roscpp, rosdoc-lite, tf2, tf2-geometry-msgs, tf2-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-melodic-odom-frame-publisher";
  version = "0.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "odom_frame_publisher-release";
    rev = "b4beca4cb07648bd16af18f911690d6423aa2864";
    owner = "OUXT-Polaris";
    sha256 = "sha256-1AK3NTOWdgVqNciPDSnq73csZfwrCssx5qBuyq/Exw0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eigen geometry-msgs quaternion-operation roscpp rosdoc-lite tf2 tf2-geometry-msgs tf2-msgs tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The odom_frame_publisher package'';
    license = with lib.licenses; [ asl20 ];
  };
}
