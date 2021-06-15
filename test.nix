let
  erlangReleases = builtins.fetchTarball https://github.com/nixerl/nixpkgs-nixerl/archive/v1.0.7-devel.tar.gz;

  nixpkgs =
    import <nixpkgs> {
      overlays = [
        (import erlangReleases)
        (import ./.)
      ];
    };

  whichErlang = nixpkgs.nixerl.erlang-22-3;
in

with nixpkgs;

mkShell {
  buildInputs = with pkgs; [
    whichErlang.erlang
    whichErlang.rebar3


    purerl-support.purty-7-0-0
    purerl-support.purescript-0-14-2
    purerl-support.spago-0-20-3
  ];
}

