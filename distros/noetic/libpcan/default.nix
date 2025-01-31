
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-libpcan";
  version = "0.6.18-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_extern-release";
    rev = "0ff61fbf40e2ec219d16ccc52454f1b247f64847";
    owner = "ipa320";
    sha256 = "sha256-CRL7v02SKKXwJdlp2oT+81rSvVY482G6Sh5uhzG4Xk8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package wraps the libpcan to use it as a ros dependency'';
    license = with lib.licenses; [ "LGPL" ];
  };
}
