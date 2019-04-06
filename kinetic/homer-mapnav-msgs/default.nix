
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, message-generation, nav-msgs, message-runtime, actionlib, genmsg, geometry-msgs }:
buildRosPackage {
  pname = "ros-kinetic-homer-mapnav-msgs";
  version = "0.1.53";

  src = fetchurl {
    url = https://gitlab.uni-koblenz.de/robbie/homer_mapnav_msgs-release/repository/archive.tar.gz?ref=release/kinetic/homer_mapnav_msgs/0.1.53-0;
    sha256 = "12038984195da143f1d65ed613d1a28b8614fa57f0490feb74fe2fa994cdbf53";
  };

  propagatedBuildInputs = [ nav-msgs message-runtime actionlib-msgs actionlib geometry-msgs ];
  nativeBuildInputs = [ nav-msgs message-generation actionlib-msgs actionlib genmsg catkin geometry-msgs ];

  meta = {
    description = ''homer_mapnav_msgs contains the messages used for mapping and navigation'';
    #license = lib.licenses.GPLv3;
  };
}