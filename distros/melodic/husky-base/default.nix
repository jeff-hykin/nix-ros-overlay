
# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-manager, diagnostic-aggregator, diagnostic-msgs, diagnostic-updater, diff-drive-controller, geometry-msgs, hardware-interface, husky-control, husky-description, husky-msgs, roscpp, roslaunch, roslint, sensor-msgs, topic-tools }:
buildRosPackage {
  pname = "ros-melodic-husky-base";
  version = "0.4.8-r1";

  src = fetchurl {
    url = "https://github.com/clearpath-gbp/husky-release/archive/release/melodic/husky_base/0.4.8-1.tar.gz";
    name = "0.4.8-1.tar.gz";
    sha256 = "1acc7ae7628526e6f65aef5f99345c0670d444994c8d226d3d50ef36d98aebf8";
  };

  buildType = "catkin";
  buildInputs = [ roslaunch roslint ];
  propagatedBuildInputs = [ controller-manager diagnostic-aggregator diagnostic-msgs diagnostic-updater diff-drive-controller geometry-msgs hardware-interface husky-control husky-description husky-msgs roscpp sensor-msgs topic-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Clearpath Husky robot driver'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
