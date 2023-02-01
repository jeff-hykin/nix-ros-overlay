
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-heifu-msgs";
  version = "0.7.7-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "heifu-release";
    rev = "169283c96aad0300d46c99e6cdd23914de41d6c5";
    owner = "BV-OpenSource";
    sha256 = "sha256-0JBoJnJSVZBTy1F/ZORsdoBO5sgePm/v5iQP4Rw75VI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime std-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Common message definitions for heifu'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
