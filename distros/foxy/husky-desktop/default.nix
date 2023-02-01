
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, husky-msgs, husky-viz }:
buildRosPackage {
  pname = "ros-foxy-husky-desktop";
  version = "1.0.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "husky-release";
    rev = "fd2a9cda4bf6cb4a8286e506bcacf18fe6240606";
    owner = "clearpath-gbp";
    sha256 = "sha256-lI0oT6+Z7VURHQy7WYMAM0pbI19SNby4DAMy0jVRI18=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ husky-msgs husky-viz ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Metapackage for Clearpath Husky visualization software'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
