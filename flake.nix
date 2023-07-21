#https://nix-tutorial.gitlabpages.inria.fr/nix-tutorial/first-package.html
#https://dev.to/deciduously/workstation-management-with-nix-flakes-build-a-cmake-c-package-21lp
{
  description = "icepic";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    # libicepic = {
    #   url = "/home/icepic/guix/packages/libicepic";
    # };
  };



  outputs = { self, nixpkgs }: {

    # after apps

    devShells.x86_64-linux.default =  with import nixpkgs { system = "x86_64-linux"; };
      mkShell {
        buildInputs =  [ stdenv.cc.cc.lib cmake ];
        packages = with pkgs; [cmake libusb1];
      };


    packages.x86_64-linux.default =
      # Notice the reference to nixpkgs here.
      with import nixpkgs { system = "x86_64-linux"; };

      stdenv.mkDerivation rec {
        pname = "icepic";
        version = "0.1.0";
        src = ./.;
        buildInputs = [ stdenv.cc.cc.lib cmake];

        meta = with lib; {
          homepage = "http://icepic.de";
          description = "nix test library";
          platforms = platforms.linux;

        };
      };
  };
}

