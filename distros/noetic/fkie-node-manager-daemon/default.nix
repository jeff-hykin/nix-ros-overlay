
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-msgs, fkie-master-discovery, fkie-multimaster-msgs, python3Packages, roslaunch, rospy, rostest, screen }:
buildRosPackage {
  pname = "ros-noetic-fkie-node-manager-daemon";
  version = "1.3.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "multimaster_fkie-release";
    rev = "1df97850db5172ac915c52cd6fc3bc2a38b850dd";
    owner = "fkie-release";
    sha256 = "sha256-c6TGrwu+s3rmp40oOjGyuya1qkabmeiYRRUFvlBOQqs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ diagnostic-msgs fkie-master-discovery fkie-multimaster-msgs python3Packages.grpcio python3Packages.grpcio-tools python3Packages.psutil python3Packages.rospkg python3Packages.ruamel_yaml roslaunch rospy screen ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A daemon node to manage ROS launch files and launch nodes from loaded files.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
