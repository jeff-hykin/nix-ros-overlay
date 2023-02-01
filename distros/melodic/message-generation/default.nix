
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gencpp, geneus, genlisp, genmsg, gennodejs, genpy }:
buildRosPackage {
  pname = "ros-melodic-message-generation";
  version = "0.4.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "message_generation-release";
    rev = "c144793f2a739e9d358a89d7fcc07b11928adae7";
    owner = "ros-gbp";
    sha256 = "sha256-OcZUypiOwRulERTbxJV5sMzsSKXMMqWkJFWQvexUZtQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gencpp geneus genlisp genmsg gennodejs genpy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package modeling the build-time dependencies for generating language bindings of messages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
