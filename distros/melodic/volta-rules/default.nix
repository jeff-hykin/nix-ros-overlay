
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-volta-rules";
  version = "1.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "volta-release";
    rev = "7f2623f72b233fb339b7d6017fe508124e3a8752";
    owner = "botsync-gbp";
    sha256 = "sha256-hdTLbNQO0Sd0de6O5qWQATs0HUX59Gtz1VQeb/ACNi4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The volta_rules package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
