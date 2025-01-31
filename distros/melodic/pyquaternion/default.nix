
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pythonPackages }:
buildRosPackage {
  pname = "ros-melodic-pyquaternion";
  version = "0.9.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pyquaternion-release";
    rev = "f24d87d07e5d02fdfc1d5abfc06663e7842ce717";
    owner = "Achllle";
    sha256 = "sha256-B95hgJLtQ2OvbMzkzmKTUs+TNZilxXLqf73usJfThcI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pythonPackages.numpy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''quaternion operations'';
    license = with lib.licenses; [ mit ];
  };
}
