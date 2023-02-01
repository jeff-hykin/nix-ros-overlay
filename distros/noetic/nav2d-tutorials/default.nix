
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nav2d-exploration, nav2d-karto, nav2d-localizer, nav2d-msgs, nav2d-navigator, nav2d-operator, nav2d-remote }:
buildRosPackage {
  pname = "ros-noetic-nav2d-tutorials";
  version = "0.4.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_2d-release";
    rev = "0a397c126b52cd393a7021f2b6af44b613e66d56";
    owner = "skasperski";
    sha256 = "sha256-Z4yRVoTemH2OUmlzQq6VycHzoIkI3FRMKMg55WcTvUc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ nav2d-exploration nav2d-karto nav2d-localizer nav2d-msgs nav2d-navigator nav2d-operator nav2d-remote ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Contains a set of tutorials that run 2D-Navigation within Stage-Simulator.'';
    license = with lib.licenses; [ gpl3Only ];
  };
}
