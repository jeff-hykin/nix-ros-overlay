
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pythonPackages }:
buildRosPackage {
  pname = "ros-melodic-copernicus-rules";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "copernicus-release";
    rev = "f9d90864f3ec8f5bf00324d31c0286f7ba686a85";
    owner = "botsync-gbp";
    sha256 = "sha256-juYnCuJ8KrUZLRMv2Tnt2b7lMLiFkzCLvchbpmRTIYQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pythonPackages.pyusb ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The copernicus_rules package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
