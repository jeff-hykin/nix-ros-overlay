
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, uuv-teleop, uuv-trajectory-control }:
buildRosPackage {
  pname = "ros-melodic-eca-a9-control";
  version = "0.1.6";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "eca_a9-release";
    rev = "7b4527585a469aaebaccdb88c1e6a53c901f0427";
    owner = "uuvsimulator";
    sha256 = "sha256-j9oxYwisAiXFf7B3iYZrX+YzBkct2dxYKfgq/NIaKGw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ uuv-teleop uuv-trajectory-control ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Configuration and launch files to control the ECA A9 AUV'';
    license = with lib.licenses; [ asl20 ];
  };
}
