
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-index-cpp, ceres-solver, eigen, glog, libyamlcpp, qt5 }:
buildRosPackage {
  pname = "ros-galactic-rmf-traffic-editor";
  version = "1.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_traffic_editor-release";
    rev = "9d590b086b69ba84d3a817d80a6b9f73856b17e6";
    owner = "ros2-gbp";
    sha256 = "sha256-yaXIUvNrO2a75jn3X9IPfylvRqPElKm6NlK212o+p28=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ament-index-cpp eigen libyamlcpp qt5.qtbase ];
  propagatedBuildInputs = [ ceres-solver glog ];

  meta = {
    description = ''traffic editor'';
    license = with lib.licenses; [ asl20 ];
  };
}
