
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-msgs, rospy, schunk-sdh }:
buildRosPackage {
  pname = "ros-noetic-schunk-simulated-tactile-sensors";
  version = "0.6.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "schunk_modular_robotics-release";
    rev = "9c564bf25230be619851564b7c939cd40e37ccc2";
    owner = "ipa320";
    sha256 = "sha256-P3bjg82EBGfPHnC31BV6ZxuoS42QWa2Fo10SNMCOjAE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-msgs rospy schunk-sdh ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides simulated tactile sensors for the Schunk Dextrous
     Hand (SDH) which is mounted on the Care-O-bot arm. The node subscribes to
     the Gazebo bumper topics of the SDH. It transforms the Gazebo feedback to
     the &quot;tactile_data&quot; topic to provide the same tactile sensor interface as
     the schunk_sdh package.

     The following parameters can be set:
     * cells_x: The number of patches on the tactile sensor in the direction
                perpendicular to the finger. Defaults to 6.
     * cells_y: The number of patches on the tactile sensor along the direction
                of the finger. Defaults to 14.
     * output_range: The maximum output value of one patch. Defaults to 3500.
     * sensitivity: The change of output in one patch per Newton. Defaults to
                    350. The sensitivity can be approximated by the following
                    formula: S = output_range / (measurement_range * cell_area)
                    - The measurement range of the tactile pads is 250 kPa (from
                      the data sheet).
                    - The output range can be determined by experiment from the
                      real SDH. It is about 3500.
                    - The cell area is the size of one patch. Length and width
                      of the area are determined by dividing the length/width
                      of the collision surface by the number of cells in the
                      respective direction.
                      Important: In most cases this is NOT the cell area that is
                                 given in the data sheet!
     * filter_length: The length of the moving average filter which smoothes
                      the values from simulation. Defaults to 10.

     The node subscribes to the following topics to receive data from the
     simulation:
     * thumb_2/state
     * thumb_3/state
     * finger_12/state
     * finger_13/state
     * finger_22/state
     * finger_23/state

     The node publishes the processed data on the following topic:
     * tactile_data

     The simulated bumper must obtain the collision data in the link that the
     sensor is attached to. This is achieved by setting the &quot;frameName&quot; property
     in the gazebo_ros_bumper controller.'';
    license = with lib.licenses; [ asl20 ];
  };
}
