
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, nav-msgs }:
buildRosPackage {
  pname = "ros-noetic-leo-example-follow-ar-tag";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "leo_examples-release";
    rev = "b7d31495d13ff23fb699e6d81b42df589bd394d0";
    owner = "fictionlab-gbp";
    sha256 = "sha256-kmjPTufeVHd1ZKPq0vObOwNjFXi+xvHhygqjM1MOdWQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Follow ARTag Example for Leo Rover.'';
    license = with lib.licenses; [ mit ];
  };
}
