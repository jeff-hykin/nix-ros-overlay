
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-ixblue-ins-msgs";
  version = "0.1.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ixblue_ins_stdbin_driver-release";
    rev = "b68abd85bd5ea23e875b270e26cdbfec9c345f12";
    owner = "ixblue";
    sha256 = "sha256-mGmykbgOqH5j2XSi0VVw6+MdufbCFUtLo5vYaMvbzJk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The ixblue INS defined messages package'';
    license = with lib.licenses; [ mit ];
  };
}
