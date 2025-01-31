
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake, pcl }:
buildRosPackage {
  pname = "ros-melodic-quanergy-client";
  version = "5.0.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "quanergy_client-release";
    rev = "05e424677b326ffa8625148f812e23b860fe8615";
    owner = "QuanergySystems";
    sha256 = "sha256-AvobCVq5Du1Z7XFAEZNur9O/rxy6apcOoOCz1arYjcM=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ boost catkin pcl ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Quanergy Sensor SDK'';
    license = with lib.licenses; [ mit ];
  };
}
