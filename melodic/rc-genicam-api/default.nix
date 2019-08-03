
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake, libusb }:
buildRosPackage {
  pname = "ros-melodic-rc-genicam-api";
  version = "2.2.2-r1";

  src = fetchurl {
    url = https://github.com/roboception-gbp/rc_genicam_api-release/archive/release/melodic/rc_genicam_api/2.2.2-1.tar.gz;
    sha256 = "3d0e150794ab2b8363be54bb37e4fdb35737aa99c7c58fb1fd17c6dfc1dc745c";
  };

  buildInputs = [ libusb ];
  propagatedBuildInputs = [ catkin libusb ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''GenICam/GigE Vision Convenience Layer.

      This package combines the Roboception convenience layer for images with the
      GenICam reference implementation and a GigE Vision transport layer. It is a
      self contained package that permits configuration and image streaming of
      GenICam / GigE Vision 2.0 compatible cameras like the Roboception rc_visard.

      This package also provides some tools that can be called from the command line
      for discovering cameras, changing their configuration and streaming images.
      Although the tools are meant to be useful when working in a shell or in a
      script, their main purpose is to serve as example on how to use the API for
      reading and setting parameters, streaming and synchronizing images.

      See LICENSE.md for licensing terms of the different parts.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
