
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, bondpy, catkin, geometry-msgs, message-generation, message-runtime, nodelet, pythonPackages, roslaunch, rospy, rosservice, rostest, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-capabilities";
  version = "0.2.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "capabilities-release";
    rev = "b32dd8198e1cf2b0467c2802a00247da529150a8";
    owner = "ros-gbp";
    sha256 = "sha256-gsQu49rMCXcnnxjiResH//6LKotvU0/C0e037Htp5H0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation rostest ];
  checkInputs = [ geometry-msgs pythonPackages.coverage pythonPackages.mock pythonPackages.pep8 rosservice ];
  propagatedBuildInputs = [ bondpy message-runtime nodelet pythonPackages.pyyaml roslaunch rospy std-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package which implements capabilities, including code to parse capability interface specs, to parse capability provider specs, and implement the capability server.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
