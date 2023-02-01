
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, roscpp, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-uos-freespace";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uos-tools";
    rev = "d3befade45c673089c11ad6f8215d2a14e253777";
    owner = "uos-gbp";
    sha256 = "sha256-nv5OxGe04nrd2Cad+cAd30p+kRi89d/QZcS7MajMl5s=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs roscpp sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''uos_freespace package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
