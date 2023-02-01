
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cppzmq, roslib }:
buildRosPackage {
  pname = "ros-melodic-behaviortree-cpp";
  version = "2.5.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "behaviortree_cpp-release";
    rev = "591bfa9148bdefbd4becd364094dbbe9eeffb11a";
    owner = "BehaviorTree";
    sha256 = "sha256-0zmtXVWficoB3G4ZPBijEZPgzWqPtCNIH7CCLS3z/90=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cppzmq roslib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides a behavior trees core.'';
    license = with lib.licenses; [ mit ];
  };
}
