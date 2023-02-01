
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosbridge-server, roslaunch, rostest, roswww, rwt-utils-3rdparty, speech-recognition-msgs }:
buildRosPackage {
  pname = "ros-melodic-rwt-speech-recognition";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_rwt-release";
    rev = "0df5748daffecac5dc295c3644c745b0d8b8c9b0";
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
