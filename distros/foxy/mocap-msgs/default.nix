
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, builtin-interfaces, geometry-msgs, rclcpp, rosidl-default-generators, std-msgs }:
buildRosPackage {
  pname = "ros-foxy-mocap-msgs";
  version = "0.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mocap_msgs-release";
    rev = "f7e1bc5df383336a8877158cbc777246c4586560";
    owner = "MOCAP4ROS2-Project";
    sha256 = "sha256-p9KOpyPCi4aIyG5ore15EfRRKdMnbp+LM8gWCpDjoNg=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rosidl-default-generators std-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''mocap_msgs'';
    license = with lib.licenses; [ asl20 ];
  };
}
