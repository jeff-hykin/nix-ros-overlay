
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, dynamic-reconfigure, roslib }:
buildRosPackage {
  pname = "ros-noetic-mini-maxwell";
  version = "2.1.21-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_3rdparty-release";
    rev = "1c2b855bd460b04bea6a533c66f6618f7f4b9dae";
    owner = "tork-a";
    sha256 = "sha256-TNcwybzUvaydQ3jLDVJLgzHpD/fhRY7H9ehmebh5Ttk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules roslib ];
  propagatedBuildInputs = [ dynamic-reconfigure ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''mini_maxwell'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
