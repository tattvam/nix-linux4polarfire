let
  overlay = self: super: {
    linux = self.callPackage ./kernel.nix {};
    gcc = self.gcc11;
  };
in import <nixpkgs> {
  #config.replaceStdenv = { pkgs, ... }: pkgs.gcc11872121Stdenv;
  crossSystem = {
    system = "riscv64-linux";
  };
  overlays = [
    (import ./overlays/overlay.nix)
    overlay
  ];
}
