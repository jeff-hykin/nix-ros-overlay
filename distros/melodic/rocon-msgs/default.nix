
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, concert-msgs, concert-service-msgs, gateway-msgs, rocon-app-manager-msgs, rocon-device-msgs, rocon-interaction-msgs, rocon-service-pair-msgs, rocon-std-msgs, rocon-tutorial-msgs, scheduler-msgs }:
buildRosPackage {
  pname = "ros-melodic-rocon-msgs";
  version = "0.9.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rocon_msgs-release";
    rev = "905d8b759c5d7d2895c7764fdd70028c357bfbfb";
    owner = "yujinrobot-release";
    sha256 = "sha256-AMsXEOV49zOw6+a+doG79b0kykK8nQJmpUFGtmVSoFM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ concert-msgs concert-service-msgs gateway-msgs rocon-app-manager-msgs rocon-device-msgs rocon-interaction-msgs rocon-service-pair-msgs rocon-std-msgs rocon-tutorial-msgs scheduler-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Communication types (msgs/srvs/actions) for robotics in concert (aka multimaster).'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
