
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake, git, iceoryx-utils }:
buildRosPackage {
  pname = "ros-galactic-iceoryx-posh";
  version = "1.0.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "iceoryx-release";
    rev = "d17617220ea6cc0df6a4f9360fe6deb844a4ba31";
    owner = "ros2-gbp";
    sha256 = "sha256-lwb18jEN4K/ybPwnqjwo9Ym/NaWiGtUwRlGI8sOHH58=";
  };

  buildType = "cmake";
  buildInputs = [ cmake git iceoryx-utils ];
  nativeBuildInputs = [ cmake git ];

  meta = {
    description = ''Eclipse iceoryx inter-process-communication (IPC) middleware Posix Shared Memory Library and middleware daemon (RouDi)'';
    license = with lib.licenses; [ asl20 ];
  };
}
