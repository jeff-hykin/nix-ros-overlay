
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, igvc-self-drive-description, igvc-self-drive-gazebo, igvc-self-drive-gazebo-plugins }:
buildRosPackage {
  pname = "ros-melodic-igvc-self-drive-sim";
  version = "0.1.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "igvc_self_drive_sim-release";
    rev = "e46b5fea37e1984c6182a97390aabb9550113c10";
    owner = "robustify";
    sha256 = "sha256-kOPI73PHUXpGvyDNzMoP4oKS3l7oUqUgW4JwxNBUJR4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ igvc-self-drive-description igvc-self-drive-gazebo igvc-self-drive-gazebo-plugins ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage for igvc_self_drive_sim'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
