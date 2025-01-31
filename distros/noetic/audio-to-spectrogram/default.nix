
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, audio-capture, audio-common-msgs, catkin, cv-bridge, image-view, jsk-recognition-msgs, python3Packages, roslaunch, rostest, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-audio-to-spectrogram";
  version = "1.2.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_recognition-release";
    rev = "95b0f482c9854a1c08f146b122f53757e62616b7";
    owner = "tork-a";
    sha256 = "sha256-3JZL2ciRG8aecL9sBrfEGNYlAcdP0xrezuHrdZKswMw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ audio-capture audio-common-msgs cv-bridge image-view jsk-recognition-msgs python3Packages.matplotlib sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Convert audio (audio_common_msgs/AudioData) to spectrogram (sensor_msgs/Image)'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
