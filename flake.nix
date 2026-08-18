{
  description = "Response rules for AI coding agents, based on ISO 24495-1:2023.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      imports = [ inputs.treefmt-nix.flakeModule ];
      perSystem = _: {
        treefmt = {
          projectRootFile = "flake.nix";
          programs.actionlint.enable = true;
          programs.deadnix.enable = true;
          programs.prettier.enable = true;
          programs.nixfmt.enable = true;
          programs.statix.enable = true;
        };
      };
    };
}
