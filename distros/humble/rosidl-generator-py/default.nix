
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-pytest, ament-index-python, ament-lint-auto, ament-lint-common, python-cmake-module, python3Packages, pythonPackages, rmw, rosidl-cli, rosidl-cmake, rosidl-generator-c, rosidl-generator-cpp, rosidl-parser, rosidl-runtime-c, rosidl-typesupport-c, rosidl-typesupport-fastrtps-c, rosidl-typesupport-interface, rosidl-typesupport-introspection-c, rpyutils, test-interface-files }:
buildRosPackage {
  pname = "ros-humble-rosidl-generator-py";
  version = "0.14.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosidl_python-release";
    rev = "6536f1adb47385517e602cf9f3d6237fe1607568";
    owner = "ros2-gbp";
    sha256 = "sha256-Jp9R01WPAydslbFGcZGc3bNj7fqZgTGvygwYkF7HUac=";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-cmake-pytest ament-index-python ament-lint-auto ament-lint-common python-cmake-module python3Packages.numpy pythonPackages.pytest rmw rosidl-cmake rosidl-generator-c rosidl-generator-cpp rosidl-parser rosidl-typesupport-c rosidl-typesupport-fastrtps-c rosidl-typesupport-introspection-c rpyutils test-interface-files ];
  propagatedBuildInputs = [ ament-cmake ament-index-python python-cmake-module python3Packages.numpy rmw rosidl-cli rosidl-cmake rosidl-generator-c rosidl-parser rosidl-runtime-c rosidl-typesupport-c rosidl-typesupport-interface rpyutils ];
  nativeBuildInputs = [ ament-cmake ament-index-python python-cmake-module rosidl-cmake rosidl-generator-c rosidl-typesupport-c rosidl-typesupport-interface ];

  meta = {
    description = ''Generate the ROS interfaces in Python.'';
    license = with lib.licenses; [ asl20 ];
  };
}
