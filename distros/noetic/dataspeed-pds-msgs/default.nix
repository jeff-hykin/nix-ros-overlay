
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, rosbag-migration-rule, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-dataspeed-pds-msgs";
  version = "1.0.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dataspeed_pds-release";
    rev = "946b1df8c903118f467a1710a62f520df509866a";
    owner = "DataspeedInc-release";
    sha256 = "sha256-T6S2l2IuCi7rEupPJ3JZaLAqiNvD6+PRTUm+DOY3pjc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime rosbag-migration-rule std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages for the Dataspeed Inc. Intelligent Power Distribution System (iPDS)'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
