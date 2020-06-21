let
  fetch = { rev, sha256 }:
    builtins.fetchTarball {
      url = "https://github.com/nixos/nixpkgs-channels/archive/${rev}.tar.gz";
      inherit sha256;
    };
in
{
  # To update, run ../helper/fetch-channel REV
  nixpkgs = fetch {
    rev = "788764b193f681a0d97c1b3e98cd687d131ef6b7";
    sha256 = "1q3s901qcr42zwqiy94q35l07hiix0d5hsymib9a2kb0b8m75283";
  };
  nixpkgs-unstable = fetch {
    rev = "13e2c75c932adac6a198e35b04e2cb9a1eaf86cf";
    sha256 = "0q1dcnclgzgv6sl0mynhn14nmb08g0cckd7zzyv2phzla18hap7a";
  };
}
