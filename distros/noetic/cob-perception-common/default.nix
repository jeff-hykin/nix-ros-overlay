
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-3d-mapping-msgs, cob-cam3d-throttle, cob-image-flip, cob-object-detection-msgs, cob-object-detection-visualizer, cob-perception-msgs, cob-vision-utils }:
buildRosPackage {
  pname = "ros-noetic-cob-perception-common";
  version = "0.6.19-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_perception_common-release";
    rev = "fbd4ea831e9fa1eae4d6260420984692d0a7ae08";
    owner = "ipa320";
    sha256 = "sha256-5qCQSDVrUq3WQP7hl2SX5hTPf+1ccB0UyR/w201miAw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-3d-mapping-msgs cob-cam3d-throttle cob-image-flip cob-object-detection-msgs cob-object-detection-visualizer cob-perception-msgs cob-vision-utils ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This stack provides utilities commonly needed for a variety of computer vision tasks.'';
    license = with lib.licenses; [ asl20 ];
  };
}
