
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dataspeed-pds-msgs, rospy }:
buildRosPackage {
  pname = "ros-melodic-dataspeed-pds-scripts";
  version = "1.0.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dataspeed_pds-release";
    rev = "ac7e7ebfe3c260b3fd5287f71862e19b6dde6417";
    owner = "DataspeedInc-release";
    sha256 = "sha256-sDXfYOFnZaf7x/Re8ebwXEdzkfM0kX9+olQrlNwFqMY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dataspeed-pds-msgs rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Test scripts to interface to the Dataspeed Inc. Intelligent Power Distribution System (iPDS)'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
