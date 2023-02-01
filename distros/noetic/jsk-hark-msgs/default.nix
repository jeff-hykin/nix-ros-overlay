
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-jsk-hark-msgs";
  version = "4.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_common_msgs-release";
    rev = "94386f0ede562de484108ee2a54b9be59a5ee217";
    owner = "tork-a";
    sha256 = "sha256-+A7rktLXqq4ygxJQExrx043pmh0dGRNRZbtzr+BgPbk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''jsk_hark_msgs'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
