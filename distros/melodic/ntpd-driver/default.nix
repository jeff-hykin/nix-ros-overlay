
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, message-generation, message-runtime, poco, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-ntpd-driver";
  version = "1.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ntpd_driver-release";
    rev = "587f279b74db9e720689c57365b661466ce083fc";
    owner = "vooon";
    sha256 = "sha256-g/hiQyI4OvE7y4IVAAaq2ct8CenRetNeunowJvkdAX8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cmake-modules message-generation message-runtime poco roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ntpd_driver sends TimeReference message time to ntpd server'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
