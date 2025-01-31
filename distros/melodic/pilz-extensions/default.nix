
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, code-coverage, joint-limits-interface, roscpp, rostest }:
buildRosPackage {
  pname = "ros-melodic-pilz-extensions";
  version = "0.4.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pilz_industrial_motion-release";
    rev = "be5fe576b46bf5b5efe774f696139c24706dea7e";
    owner = "PilzDE";
    sha256 = "sha256-DJosG23d4lMn4ENr1aStrY1tjFlm6ut391R9HY5WTqE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roscpp ];
  checkInputs = [ code-coverage rostest ];
  propagatedBuildInputs = [ joint-limits-interface ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pilz_extensions package. Here are classes extending the functionality of other packages.
  On the long run these extensions should become pull requests on the respective packages.'';
    license = with lib.licenses; [ asl20 ];
  };
}
