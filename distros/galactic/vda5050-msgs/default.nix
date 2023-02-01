
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, rosidl-default-generators, rosidl-default-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-galactic-vda5050-msgs";
  version = "1.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_amr_interop-release";
    rev = "d96c54ab89ff6862c8cf2ee461817c9509a8d61d";
    owner = "inorbit-ai";
    sha256 = "sha256-HaA4yov3/pRO0fNM2mGxRdRRzIW28taVq8N/gN5NLNE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];

  meta = {
    description = ''The vda5050_msgs package contains the datatypes (json objects) specified by the VDA
    &quot;Arbeitskreis Schlüsseltechnologien&quot; in their recommondation &quot;VDA 5050 - Schnittstelle zur Kommunikation zwischen
    Fahrerlosen Transportfahrzeugen (FTF) und einer Leitsteuerung.
    This package provides the message files which can be used to be (de-)serialized with an implementation of mqtt
    (e.g mqtt_bridge) or to plain json (rospy_message_converter) or similar.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
