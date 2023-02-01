
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, joint-trajectory-action-tools, joint-trajectory-generator, pr2-arm-move-ik, pr2-common-action-msgs, pr2-tilt-laser-interface, pr2-tuck-arms-action }:
buildRosPackage {
  pname = "ros-melodic-pr2-common-actions";
  version = "0.0.11";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_common_actions-release";
    rev = "99a22da36cb9281715b58d59510177878f6c3cf4";
    owner = "pr2-gbp";
    sha256 = "sha256-BssSJZlFQb+mBwD4rlZepULoWBqOkywCoqVjlHE+Gtk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ joint-trajectory-action-tools joint-trajectory-generator pr2-arm-move-ik pr2-common-action-msgs pr2-tilt-laser-interface pr2-tuck-arms-action ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Various actions which help in moving the arms of the PR2
    or getting data from its tilting laser.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
