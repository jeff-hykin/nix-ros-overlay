
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, image-transport, imagezero-ros, message-runtime, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-imagezero-image-transport";
  version = "0.2.4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "imagezero_transport-release";
    rev = "b26110bd6b826c84896e3dbbcccb06be12238349";
    owner = "swri-robotics-gbp";
    sha256 = "sha256-BENMAIdW1ulOJr0Sh9YeVc7N2+HzuyMjWvzDZI4GN8Q=";
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
