
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, qt5 }:
buildRosPackage {
  pname = "ros-melodic-libqt-svg-dev";
  version = "1.0.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "qt_metapackages-release";
    rev = "7909b368eb3947e43607e72fc340ebb3e5bff4c1";
    owner = "swri-robotics-gbp";
    sha256 = "sha256-Z5hcHUKLEz2Ka4Dmze5HFBaNZN6IWiuM0KrGA+KO618=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ qt5.qtsvg ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''libqt-svg-dev metapackage supporting qt4 and qt5'';
    license = with lib.licenses; [ "United-States-Government-Purpose" "SwRI-Proprietary" ];
  };
}
