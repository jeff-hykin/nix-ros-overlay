
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-msgs, dynamic-reconfigure, ethercat-trigger-controllers, rospy, rostest, wge100-camera }:
buildRosPackage {
  pname = "ros-noetic-pr2-camera-synchronizer";
  version = "1.6.32-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_robot-release";
    rev = "0e17e34b34adcaf5586526f43d94d8f667c05831";
    owner = "pr2-gbp";
    sha256 = "sha256-80z4ZEl1fjAsTDxSCiQzoDY22uRuzklyr1JSE3o5s8k=";
  };

  buildType = "catkin";
  buildInputs = [ catkin rostest ];
  propagatedBuildInputs = [ diagnostic-msgs dynamic-reconfigure ethercat-trigger-controllers rospy wge100-camera ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''<p>
    The PR2 is equipped with a texture projector that can be used to
    project a texture onto featureless surfaces, allowing their
    three-dimensional structure to be determined using stereoscopy. The
    projector operates in a pulsed mode, producing brief (2ms) pulses of
    light. Cameras that want to see the texture must expose during the
    projector pulse; other cameras should be expose while the projector is
    off.
    </p>

    <p>
      This package contains the pr2_projector_synchronizer node. Based on its dynamically reconfigurable parameters, this node controls the projector pulsing, and sets up triggering of the WGE100 cameras.
    </p>'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
