
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, mk, roslib, rospack, rsync, unzip, wget }:
buildRosPackage {
  pname = "ros-noetic-julius";
  version = "2.1.21-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_3rdparty-release";
    rev = "12b0ccf2b35b6cd69ee2d1ac9c8556cb8035a473";
    owner = "tork-a";
    sha256 = "sha256-DoeIPtQf3KXyx/DlW13I8UDg6ipLHcVYC2tYHl8UWWE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin mk roslib rospack ];
  propagatedBuildInputs = [ rsync unzip wget ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''julius: Open-Source Large Vocabulary CSR Engine (http://julius.sourceforge.jp/index.php)'';
    license = with lib.licenses; [ "GPL" ];
  };
}
