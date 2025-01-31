
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-turtlebot3-autorace-msgs";
  version = "1.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3_autorace_2020_release";
    rev = "94e49e1fcffc6bdd4dc24f08a0d36056a489d72c";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-juuWuMtg5/KzKvogbVfVrStuCVlGZ0F/3yM9AbOF/Dc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The turtlebot3_autorace_msgs package'';
    license = with lib.licenses; [ asl20 ];
  };
}
