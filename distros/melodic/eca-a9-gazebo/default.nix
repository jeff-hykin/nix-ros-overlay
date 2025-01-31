
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eca-a9-control, eca-a9-description }:
buildRosPackage {
  pname = "ros-melodic-eca-a9-gazebo";
  version = "0.1.6";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "eca_a9-release";
    rev = "932bcc9245a6480aead8ac49aabdab8f9333f962";
    owner = "uuvsimulator";
    sha256 = "sha256-rP1bAPX+7GOkKLQnmv5xpUzoTieY4z3ST3LW7nb9DsY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eca-a9-control eca-a9-description ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package with launch files for demonstrations with the ECA A9 AUV'';
    license = with lib.licenses; [ asl20 ];
  };
}
