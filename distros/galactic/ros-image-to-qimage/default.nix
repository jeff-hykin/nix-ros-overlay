
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, cv-bridge, qt5, sensor-msgs }:
buildRosPackage {
  pname = "ros-galactic-ros-image-to-qimage";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_image_to_qimage-release";
    rev = "583860b95bb4fb41f9633bb0f440118f494e1ce3";
    owner = "ros2-gbp";
    sha256 = "sha256-m/0/fIC34tGe3fSdXlnuZlGEZ1sg3IUfDakDDxoHRA8=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ cv-bridge qt5.qtbase sensor-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''A package that converts a ros image msg to a qimage object'';
    license = with lib.licenses; [ asl20 ];
  };
}
