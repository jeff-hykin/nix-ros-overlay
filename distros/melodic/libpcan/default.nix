
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-libpcan";
  version = "0.6.17-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_extern-release";
    rev = "9a0295c80ad0169e83c595c073db6f1da86e8f64";
    owner = "ipa320";
    sha256 = "sha256-BYAN04PC7G7M6pqyjv0Pzw3S3kX2Jn8sHjja2YCt6kk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package wraps the libpcan to use it as a ros dependency'';
    license = with lib.licenses; [ "LGPL" ];
  };
}
