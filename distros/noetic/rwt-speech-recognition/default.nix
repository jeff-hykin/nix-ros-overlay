
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosbridge-server, roslaunch, rostest, roswww, rwt-utils-3rdparty, speech-recognition-msgs }:
buildRosPackage {
  pname = "ros-noetic-rwt-speech-recognition";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_rwt-release";
    rev = "6161c61d4946fca55bb090f85f7e70d6e2fcad9e";
    owner = "tork-a";
    sha256 = "sha256-1AJnTg63O6+0ZwC6Ulw02490i1FYqBbs8aKv1zGO5cs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ rosbridge-server roswww rwt-utils-3rdparty speech-recognition-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rwt_speech_recognition package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
