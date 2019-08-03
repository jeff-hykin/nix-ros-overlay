
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, roslint, catkin, message-relay, rosgraph-msgs, roscpp }:
buildRosPackage {
  pname = "ros-melodic-clock-relay";
  version = "0.0.2-r1";

  src = fetchurl {
    url = https://github.com/clearpath-gbp/cpr_multimaster_tools-release/archive/release/melodic/clock_relay/0.0.2-1.tar.gz;
    sha256 = "a140af11ea9143aa079d55b89c5513c147715041e024fa1cf6f35cd43b1a6fff";
  };

  buildInputs = [ rosgraph-msgs roscpp message-relay ];
  checkInputs = [ roslint ];
  propagatedBuildInputs = [ rosgraph-msgs roscpp message-relay ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Specialization of message_relay for clock'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
