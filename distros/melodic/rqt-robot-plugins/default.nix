
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rqt-moveit, rqt-nav-view, rqt-pose-view, rqt-robot-dashboard, rqt-robot-monitor, rqt-robot-steering, rqt-runtime-monitor, rqt-rviz, rqt-tf-tree }:
buildRosPackage {
  pname = "ros-melodic-rqt-robot-plugins";
  version = "0.5.7";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_robot_plugins-release";
    rev = "cc4f09dbb3c1a29732315dd707ada36d48b925aa";
    owner = "ros-gbp";
    sha256 = "sha256-GFbhbrQp2W1Deg8osppxkRND3v1mBxFy5Eudsxbyfbk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rqt-moveit rqt-nav-view rqt-pose-view rqt-robot-dashboard rqt-robot-monitor rqt-robot-steering rqt-runtime-monitor rqt-rviz rqt-tf-tree ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage of rqt plugins that are particularly used with robots
   during its operation.<br/>
   <br/>
   To run any rqt plugins, just type in a single command &quot;rqt&quot;, then select any plugins you want from the GUI that launches afterwards.<br/>
   <br/>
   rqt consists of three following metapackages:<br/>
    <ul>
     <li><a href="http://ros.org/wiki/rqt">rqt</a> - provides a container window
         where all rqt tools can be docked at. rqt plugin developers barely
         needs to pay attention.</li>
     <li><a href="http://ros.org/wiki/rqt_common_plugins">rqt_common_plugins</a> -
         ROS backend tools suite that can be used on/off of robot runtime.</li>
     <li>rqt_robot_plugins (You're here!)</li>
    </ul>'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
