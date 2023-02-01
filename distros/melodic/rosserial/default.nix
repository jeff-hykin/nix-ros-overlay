
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosserial-client, rosserial-msgs, rosserial-python }:
buildRosPackage {
  pname = "ros-melodic-rosserial";
  version = "0.8.0";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "ros-gbp";
        repo = "rosserial-release";
        rev = "release/melodic/rosserial/0.8.0-0";
        sha256 = "sha256-1Q0nlytKgVmP14wzVNI4mClU5QcJuVC9j+As/JPcWmQ=";
      };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rosserial-client rosserial-msgs rosserial-python ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage for core of rosserial.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
