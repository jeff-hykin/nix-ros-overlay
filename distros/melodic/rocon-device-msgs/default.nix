
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, rocon-std-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-rocon-device-msgs";
  version = "0.9.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rocon_msgs-release";
    rev = "7a4808fbf57b29c92db15b253d9ea755b449c463";
    owner = "yujinrobot-release";
    sha256 = "sha256-dy/Onl+ztpW30qdfmcN+0b80+jwQH5zzHTTGbjp+u3o=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime rocon-std-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages used by rocon devices'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
