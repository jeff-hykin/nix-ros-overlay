
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pr2-msgs, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-pr2-dashboard-aggregator";
  version = "1.13.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_common-release";
    rev = "17a4d13d979c3631737c465a5b58d87204f88d2a";
    owner = "pr2-gbp";
    sha256 = "sha256-jwWX2KShYOMNLypUEOTNTRjyzyyXfem8J+jop6mcoHs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pr2-msgs rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A simple script that aggregates all of the topics that a &quot;pr2_dashboard&quot; app might be interested in.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
