
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, abb-driver, abb-irb2400-moveit-config, abb-irb2400-moveit-plugins, abb-irb2400-support, abb-irb4400-support, abb-irb5400-support, abb-irb6600-support, abb-irb6640-moveit-config, abb-irb6640-support, abb-resources, catkin }:
buildRosPackage {
  pname = "ros-melodic-abb";
  version = "1.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "abb-release";
    rev = "9faaafb0824644e66e86717579cc526d55a0081a";
    owner = "ros-industrial-release";
    sha256 = "sha256-A4Wwmyft9EkeduJmSKDn8MplENCB0ApYuhFKCvHHuNc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ abb-driver abb-irb2400-moveit-config abb-irb2400-moveit-plugins abb-irb2400-support abb-irb4400-support abb-irb5400-support abb-irb6600-support abb-irb6640-moveit-config abb-irb6640-support abb-resources ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS-Industrial support for ABB manipulators (metapackage).'';
    license = with lib.licenses; [ bsdOriginal asl20 ];
  };
}
