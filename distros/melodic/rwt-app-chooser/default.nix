
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, app-manager, catkin, phantomjs, pythonPackages, rosbridge-server, rostest, roswww, sound-play }:
buildRosPackage {
  pname = "ros-melodic-rwt-app-chooser";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_rwt-release";
    rev = "8ec1c5a8dbaa4d945fdf5b4f698198f7b83bfc4a";
    owner = "tork-a";
    sha256 = "sha256-vgoTeghGf3cgyV0IHHPYRZL9ydYTTxcnQBeinBsxnCg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ phantomjs pythonPackages.selenium rostest ];
  propagatedBuildInputs = [ app-manager rosbridge-server roswww sound-play ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The simple web frontend for app_manager'';
    license = with lib.licenses; [ mit ];
  };
}
