
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-android-msgs, cob-script-server, pythonPackages, rospy }:
buildRosPackage {
  pname = "ros-melodic-cob-android-script-server";
  version = "0.1.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_android-release";
    rev = "826e672b9a69edfc4464e17dd44383b4b85843fe";
    owner = "ipa320";
    sha256 = "sha256-wwXMp1KYUF5GdIxGOoeiHkpkA6u6XVWy5+Of5rNrA8g=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pythonPackages.setuptools ];
  propagatedBuildInputs = [ cob-android-msgs cob-script-server rospy ];
  nativeBuildInputs = [ catkin pythonPackages.setuptools ];

  meta = {
    description = ''cob_android_script_server'';
    license = with lib.licenses; [ asl20 ];
  };
}
