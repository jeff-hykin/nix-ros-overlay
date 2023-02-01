
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, nao-sensor-msgs, pythonPackages }:
buildRosPackage {
  pname = "ros-galactic-nao-button-sim";
  version = "0.1.1-r6";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "nao_button_sim-release";
    rev = "5c1b2590f4ffd7bf2557e7c217c0a17d606f85c2";
    owner = "ros2-gbp";
    sha256 = "sha256-kSAZ/BDlwmj/kpJek7GBfiEO1RBUa8Lmld+ZbxmlAX0=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ nao-sensor-msgs ];

  meta = {
    description = ''Allows simulating button presses through command line interface'';
    license = with lib.licenses; [ asl20 ];
  };
}
