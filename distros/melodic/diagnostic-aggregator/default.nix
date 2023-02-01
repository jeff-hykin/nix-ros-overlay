
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, bondcpp, bondpy, catkin, diagnostic-msgs, pluginlib, roscpp, rospy, rostest, xmlrpcpp }:
buildRosPackage {
  pname = "ros-melodic-diagnostic-aggregator";
  version = "1.9.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "diagnostics-release";
    rev = "664d9d887e84d00530b495edde88ecda67acced9";
    owner = "ros-gbp";
    sha256 = "sha256-GM24c/sOlOi1+V7WpQFYURvxUFZPGBM0iQlHtja93Us=";
  };

  buildType = "catkin";
  buildInputs = [ catkin rostest ];
  propagatedBuildInputs = [ bondcpp bondpy diagnostic-msgs pluginlib roscpp rospy xmlrpcpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''diagnostic_aggregator'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
