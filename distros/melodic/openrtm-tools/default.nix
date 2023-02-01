
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, openrtm-aist, openrtm-aist-python, rosbash, rostest, rtshell }:
buildRosPackage {
  pname = "ros-melodic-openrtm-tools";
  version = "1.4.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rtmros_common-release";
    rev = "8b92ec29acabe207ef88f706bf216c0af38b04b4";
    owner = "tork-a";
    sha256 = "sha256-0eDPw2hCsGg0BVEoqvuAtn/tTOKASoDPSRVVBYp9TG4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin rostest ];
  propagatedBuildInputs = [ openrtm-aist openrtm-aist-python rosbash rtshell ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The openrtm_tools package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
