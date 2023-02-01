
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, networkmanager }:
buildRosPackage {
  pname = "ros-melodic-network-autoconfig";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "network_autoconfig";
    rev = "82db626da89f6c8f05aea43b4def9df968b38a01";
    owner = "LucidOne-release";
    sha256 = "sha256-vgn2TCTExrx+QkX8Cu/5wQ0u14cednT+6/D+TKT+lg0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ networkmanager ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS Networking Autoconfiguration'';
    license = with lib.licenses; [ mit "Apache" ];
  };
}
