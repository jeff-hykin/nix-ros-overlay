
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, roscpp, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-polar-scan-matcher";
  version = "0.3.3-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "scan_tools-release";
    rev = "e7581bd1d9b000c2985cc42db160b28545c0637a";
    owner = "ros-gbp";
    sha256 = "sha256-Yp0SMPPD1m1o279HCJSTygOmAdVd+QDgf93Fg9Y+6gc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs roscpp sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''<p>
    A wrapper around Polar Scan Matcher by Albert Diosi and Lindsay Kleeman, used for laser scan registration.
    </p>'';
    license = with lib.licenses; [ "GPL" ];
  };
}
