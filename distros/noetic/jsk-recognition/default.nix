
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, checkerboard-detector, imagesift, jsk-pcl-ros, jsk-perception, jsk-recognition-msgs, jsk-recognition-utils, resized-image-transport }:
buildRosPackage {
  pname = "ros-noetic-jsk-recognition";
  version = "1.2.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_recognition-release";
    rev = "6f84abe14b9c51a9885f79d541b8d46a855c0093";
    owner = "tork-a";
    sha256 = "sha256-/zGusMJaBzIsW3bOlA/A+3xI/ZB7QBCyZ+nYdRpUEiQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ checkerboard-detector imagesift jsk-pcl-ros jsk-perception jsk-recognition-msgs jsk-recognition-utils resized-image-transport ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''<p>Metapackage that contains recognition package for jsk-ros-pkg</p>'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
