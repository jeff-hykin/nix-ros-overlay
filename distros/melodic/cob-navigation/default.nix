
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-linear-nav, cob-map-accessibility-analysis, cob-mapping-slam, cob-navigation-config, cob-navigation-global, cob-navigation-local, cob-navigation-slam }:
buildRosPackage {
  pname = "ros-melodic-cob-navigation";
  version = "0.6.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_navigation-release";
    rev = "40b2764b23ba8bfc3bbafa5ca0687ca9b3ffcb49";
    owner = "ipa320";
    sha256 = "sha256-qZmdfSdzgWImaxHZJufqInPxSiUtekq6COizkVBDIXw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-linear-nav cob-map-accessibility-analysis cob-mapping-slam cob-navigation-config cob-navigation-global cob-navigation-local cob-navigation-slam ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The cob_navigation stack provides different navigation packages for <a href="http://ros.org/wiki/care-o-bot">Care-O-bot</a>.'';
    license = with lib.licenses; [ asl20 ];
  };
}
