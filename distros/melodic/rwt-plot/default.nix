
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, rosbridge-server, rospy, rostest, roswww, rwt-utils-3rdparty, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-rwt-plot";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_rwt-release";
    rev = "ba09b29a87689c9dd06dcf2162865f29abc1f003";
    owner = "tork-a";
    sha256 = "sha256-Y/zpc6zAB/LdMAzXeTGZocRIipdrybqeWHmmE++gxaA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ geometry-msgs rosbridge-server rospy roswww rwt-utils-3rdparty std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rwt_plot'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
