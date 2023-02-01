
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, jsk-footstep-msgs, jsk-gui-msgs, jsk-hark-msgs, posedetection-msgs, speech-recognition-msgs }:
buildRosPackage {
  pname = "ros-noetic-jsk-common-msgs";
  version = "4.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_common_msgs-release";
    rev = "ab0e2c6974c317f877ab0e4d1fbf34180fe9714a";
    owner = "tork-a";
    sha256 = "sha256-RbmHR0OFmpjcvneWSg5SUm6f4clt6f4LDGFb6YekHXg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ jsk-footstep-msgs jsk-gui-msgs jsk-hark-msgs posedetection-msgs speech-recognition-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''<p>Metapackage that contains commonly used messages for jsk-ros-pkg</p>'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
