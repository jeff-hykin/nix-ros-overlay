
# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, fmi-adapter, roscpp, rqt-plot }:
buildRosPackage {
  pname = "ros-melodic-fmi-adapter-examples";
  version = "1.0.4-r1";

  src = fetchurl {
    url = "https://github.com/boschresearch/fmi_adapter-release/archive/release/melodic/fmi_adapter_examples/1.0.4-1.tar.gz";
    name = "1.0.4-1.tar.gz";
    sha256 = "043af4d2b06613c1454da61302fd10367a6ac30ae5bc506b833351dd171d966c";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ fmi-adapter roscpp rqt-plot ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Provides small examples for use of the fmi_adapter package'';
    license = with lib.licenses; [ asl20 ];
  };
}
