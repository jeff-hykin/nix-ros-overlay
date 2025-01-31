
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, image-transport, imagezero-ros, message-runtime, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-imagezero-image-transport";
  version = "0.2.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "imagezero_transport-release";
    rev = "71df186975f11c7835416c4895ee0ee0b3b9fc55";
    owner = "swri-robotics-gbp";
    sha256 = "sha256-a4BovGUmbIymckl2H0m2ZjNqd4xfEKbTpQ1Yl8ofOgk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge image-transport imagezero-ros message-runtime sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A plugin to image_transport for transparently sending images encoded with ImageZero.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
