
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, hdf5-map-io, label-manager, mesh-msgs }:
buildRosPackage {
  pname = "ros-noetic-mesh-msgs-hdf5";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mesh-tools";
    rev = "13a2db247a5110638060042bcb94ff6938f104dd";
    owner = "uos-gbp";
    sha256 = "sha256-Kf9SeFfh5uU41UM+re99mUAJyr+edzyE8/KCkuYqR/U=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ hdf5-map-io label-manager mesh-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Read mesh_msgs from hdf5'';
    license = with lib.licenses; [ bsd3 ];
  };
}
