
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, lvr2 }:
buildRosPackage {
  pname = "ros-melodic-hdf5-map-io";
  version = "1.1.0-r1";

  src = fetchurl {
    url = "https://github.com/uos-gbp/mesh-tools/archive/c50b5562932686a326ae7a658855d5751d7e5c95.tar.gz";
    sha256 = "sha256-uGfz9W97JDomrPLt7PKwlP4UGNdee8XJwzovBpzyra8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ boost lvr2 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The hdf5_map_io package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
