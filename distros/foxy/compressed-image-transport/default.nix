
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, cv-bridge, image-transport }:
buildRosPackage {
  pname = "ros-foxy-compressed-image-transport";
  version = "2.3.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "image_transport_plugins-release";
    rev = "5e085225750421a1af86cb3a2841bf5a564ca677";
    owner = "ros2-gbp";
    sha256 = "sha256-6ryHWZSzl8915dbOeIZSo/6nUKUi2e2krKoUtIgCNRk=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Compressed_image_transport provides a plugin to image_transport for transparently sending images
    encoded as JPEG or PNG.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
