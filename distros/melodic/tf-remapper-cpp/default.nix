
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, rostest, tf, tf2-msgs, xmlrpcpp }:
buildRosPackage {
  pname = "ros-melodic-tf-remapper-cpp";
  version = "1.1.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tf_remapper_cpp-release";
    rev = "05caf8830ec38f53e63e0f9c24dd2c5a6b66cd01";
    owner = "peci1";
    sha256 = "sha256-gPTx/WRgemtvKvNrCviawV3/lxdKSGSZADICFHMss9k=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest tf ];
  propagatedBuildInputs = [ roscpp tf2-msgs xmlrpcpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''More efficient version of tf/tf_remap able to handle TFs at kHz with tens of subscribers.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
