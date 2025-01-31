
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rwt-app-chooser, rwt-image-view, rwt-plot, rwt-speech-recognition, rwt-utils-3rdparty }:
buildRosPackage {
  pname = "ros-noetic-visualization-rwt";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_rwt-release";
    rev = "13d9d6a7a14fdb57916fa607c70048c88e1f65e1";
    owner = "tork-a";
    sha256 = "sha256-qDGh7WzFmQYV/+UuebOZU5C7cNH3xxDvxmem7/aJ2Mg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rwt-app-chooser rwt-image-view rwt-plot rwt-speech-recognition rwt-utils-3rdparty ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''<p>visualization packages using rwt</p>'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
