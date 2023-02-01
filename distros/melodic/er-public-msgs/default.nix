
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-er-public-msgs";
  version = "1.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "er_public_msgs-release";
    rev = "aed00ea28f453ddcf7d39bbe076d13d372a2ad7f";
    owner = "enabled-robotics";
    sha256 = "sha256-i5RtfMdO7CyQSySWTit9z+oBmDbEHNTxst/L0qiVoDM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime std-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Enabled Robotics public messages package'';
    license = with lib.licenses; [ mit ];
  };
}
