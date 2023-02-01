
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, open-manipulator-p-control-gui, open-manipulator-p-controller, open-manipulator-p-description, open-manipulator-p-libs, open-manipulator-p-teleop }:
buildRosPackage {
  pname = "ros-melodic-open-manipulator-p";
  version = "1.0.0-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "open_manipulator_p-release";
    rev = "1d2b7aa3201bc1bd1939f6dbb217827eb3c9efde";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-qbjLZs+oxbf8CPJIFzlxKU0yKvk3jyvUc2FoiHllKiQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ open-manipulator-p-control-gui open-manipulator-p-controller open-manipulator-p-description open-manipulator-p-libs open-manipulator-p-teleop ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage for OpenMANIPULATOR-P'';
    license = with lib.licenses; [ asl20 ];
  };
}
