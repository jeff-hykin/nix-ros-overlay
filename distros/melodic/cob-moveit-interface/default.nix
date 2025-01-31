
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-script-server, geometry-msgs, moveit-commander, pythonPackages, rospy, tf }:
buildRosPackage {
  pname = "ros-melodic-cob-moveit-interface";
  version = "0.7.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_manipulation-release";
    rev = "82494865a9fc75810b221726d9626d4b1e3f913c";
    owner = "ipa320";
    sha256 = "sha256-EbHyQGDZwoWIY0LD2T2v8rE3OgwhMkQgsoDKUpgYVWA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pythonPackages.setuptools ];
  propagatedBuildInputs = [ cob-script-server geometry-msgs moveit-commander pythonPackages.six rospy tf ];
  nativeBuildInputs = [ catkin pythonPackages.setuptools ];

  meta = {
    description = ''cob_moveit_interface'';
    license = with lib.licenses; [ asl20 ];
  };
}
