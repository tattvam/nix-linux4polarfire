{ fetchFromGitHub, linuxHelpers }:

with linuxHelpers.linux;

let

  source = prepareSource {
    version = "5.2.15";
    src = fetchFromGitHub {
      owner = "tattvam";
      repo = "linux4polarfire";
      rev = "092908da72ccff02c426c65fa1902f6628eb9b61";
      sha256 = "sha256-OtS5bcWt/Qjz5YGyhMcRSm6MCQ61WHpYtjU8GP25B68=";
    };
    patches = with kernelPatches; [
      # ...
    ];
  };

  config = makeConfig {
    inherit source;
    target = "alldefconfig";
    allconfig = ./kconfig/defconfig;
  };

in buildKernel rec {
  inherit source config;
  dtbs = true;
}
