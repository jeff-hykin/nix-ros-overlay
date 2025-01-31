
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, radar-msgs, ros-environment, shape-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-derived-object-msgs";
  version = "3.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "astuff_sensor_msgs-release";
    rev = "7b0d9a26c13668441d4a08659be3add074a32000";
    owner = "astuff";
    sha256 = "sha256-wtD3ixCqLgLsnu/8wBZjoTkbnE+DcRKlA/jbKTMAz60=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ros-environment ];
  propagatedBuildInputs = [ geometry-msgs message-runtime radar-msgs shape-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Abstracted Messages from Perception Modalities'';
    license = with lib.licenses; [ mit ];
  };
}
