
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, audio-capture, audio-common-msgs, catkin, cv-bridge, image-view, jsk-recognition-msgs, pythonPackages, roslaunch, rostest, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-audio-to-spectrogram";
  version = "1.2.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_recognition-release";
    rev = "b0ec750fa7f06c924c8ba926b6ca3aee3d7c4440";
    owner = "tork-a";
    sha256 = "sha256-3JZL2ciRG8aecL9sBrfEGNYlAcdP0xrezuHrdZKswMw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ audio-capture audio-common-msgs cv-bridge image-view jsk-recognition-msgs pythonPackages.matplotlib sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Convert audio (audio_common_msgs/AudioData) to spectrogram (sensor_msgs/Image)'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
