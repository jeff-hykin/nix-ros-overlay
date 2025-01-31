
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, libcap, roscpp }:
buildRosPackage {
  pname = "ros-noetic-ethercat-grant";
  version = "0.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ethercat_grant-release";
    rev = "8dbc443e7f2a50820936554c3b0c5438c826ed66";
    owner = "shadow-robot";
    sha256 = "sha256-WZ2KN2JIGpwWrwplBHK0/NvGFR+8Qb76EJzPqkcErNw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ libcap roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Makes it possible to run the ros_ethercat_loop without using sudo. Forked from pr2-grant'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
