
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pr2-controller-manager, pr2-controllers-msgs, trajectory-msgs }:
buildRosPackage {
  pname = "ros-melodic-pr2-mannequin-mode";
  version = "0.6.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_apps-release";
    rev = "404a73039952c1635b4963311eb0eb396b5c6749";
    owner = "pr2-gbp";
    sha256 = "sha256-eRgSygOIIIMOASynRFFFyBPMDVyEhYtBPQ1C9IruVVs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pr2-controller-manager pr2-controllers-msgs trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pr2_mannequin_mode package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
