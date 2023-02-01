
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, libgphoto2, message-generation, message-runtime, opencv, roscpp, self-test, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-photo";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "photo-release";
    rev = "5b2ddc42a330be5de4d88e6ec8ded972ec67a03b";
    owner = "bosch-ros-pkg";
    sha256 = "sha256-5E1FTiq5QT+FC5TsagoKJKGGX3PykZ7BoPnSHs9VOa0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ libgphoto2 message-runtime opencv roscpp self-test sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The photo package provides access to digital cameras. Much of the underlying functionality is provide by the gPhoto libary. The system package libgphoto2-2-dev or equivalent is required.&gt;'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
