
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, libsForQt5, qt5, rosbag, roscpp, rqt-gui, rqt-gui-cpp, variant-topic-tools }:
buildRosPackage {
  pname = "ros-melodic-rqt-multiplot";
  version = "0.0.10";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_multiplot_plugin-release";
    rev = "890b0183dd413c19d262447de004e70f23b03cee";
    owner = "anybotics";
    sha256 = "sha256-CnQEVSfDrT3vzAEozmck7WmNXCd0F1f++uDJ6sDQAWk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ libsForQt5.qwt qt5.qtbase rosbag roscpp rqt-gui rqt-gui-cpp variant-topic-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rqt_multiplot provides a GUI plugin for visualizing numeric values
    in multiple 2D plots using the Qwt plotting backend.'';
    license = with lib.licenses; [ "GNU-Lesser-General-Public-License-LGPL-" ];
  };
}
