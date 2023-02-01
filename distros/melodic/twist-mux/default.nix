
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-updater, geometry-msgs, roscpp, rospy, rostest, rostopic, std-msgs, twist-mux-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-twist-mux";
  version = "3.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "twist_mux-release";
    rev = "e3e2ec67cbf231f5a7f53d4d272252500eef09a2";
    owner = "ros-gbp";
    sha256 = "sha256-CCIS9YXTYqoQyvK4VNkMOwAI4anz2NfTeVJtom7YmWA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin rostest ];
  checkInputs = [ rospy rostopic ];
  propagatedBuildInputs = [ diagnostic-updater geometry-msgs roscpp std-msgs twist-mux-msgs visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Twist multiplexer, which multiplex several velocity commands (topics) and
      allows to priorize or disable them (locks).'';
    license = with lib.licenses; [ cc-by-nc-sa-40 ];
  };
}
