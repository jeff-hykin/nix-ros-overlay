
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, lgsvl-msgs }:
buildRosPackage {
  pname = "ros-melodic-autoware-external-msgs";
  version = "1.14.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "messages-release";
    rev = "514e192504a07958d7d71462422779c60eb24595";
    owner = "autoware-ai";
    sha256 = "sha256-oA7G2JChxlLR6VtW3innvM4XLOtdyfy6c7j7zZUJrCU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ lgsvl-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package to contain an install external message dependencies'';
    license = with lib.licenses; [ asl20 ];
  };
}
