
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-aggregator, fetch-description, fetch-drivers, fetch-navigation, fetch-open-auto-dock, fetch-teleop, graft, joy, ps3joy, robot-state-publisher, sick-tim, sound-play }:
buildRosPackage {
  pname = "ros-melodic-freight-bringup";
  version = "0.8.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fetch_robots-release";
    rev = "f5d3e533d1f74e39ae6af82b1a84fa571f33776c";
    owner = "fetchrobotics-gbp";
    sha256 = "sha256-P/Khu8Gaxe+8qG1r2Mdt0SfXWEYoBjwBYkfK6D3v+5s=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ diagnostic-aggregator fetch-description fetch-drivers fetch-navigation fetch-open-auto-dock fetch-teleop graft joy ps3joy robot-state-publisher sick-tim sound-play ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Bringup for freight'';
    license = with lib.licenses; [ "Proprietary" ];
  };
}
