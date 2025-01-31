
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-aggregator, diagnostic-msgs, diagnostic-updater, dynamic-reconfigure, dynamic-tf-publisher, eigen-conversions, geometry-msgs, image-transport, message-generation, message-runtime, nodelet, pythonPackages, roscpp, roscpp-tutorials, roslaunch, roslint, rosnode, rostest, rostime, rostopic, sensor-msgs, sound-play, std-msgs, std-srvs, tf, topic-tools, unixtools }:
buildRosPackage {
  pname = "ros-melodic-jsk-topic-tools";
  version = "2.2.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_common-release";
    rev = "354f0c04b3e20409033a04da6c667aacb052541a";
    owner = "tork-a";
    sha256 = "sha256-dSPXQ06+0SIVrSfTQvpFc1zYYuZ09sjqpQdlGRUO5Fo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation rostest ];
  checkInputs = [ roscpp-tutorials roslint ];
  propagatedBuildInputs = [ diagnostic-aggregator diagnostic-msgs diagnostic-updater dynamic-reconfigure dynamic-tf-publisher eigen-conversions geometry-msgs image-transport message-runtime nodelet pythonPackages.numpy pythonPackages.opencv3 pythonPackages.scipy roscpp roslaunch rosnode rostime rostopic sensor-msgs sound-play std-msgs std-srvs tf topic-tools unixtools.ping ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''jsk_topic_tools'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
