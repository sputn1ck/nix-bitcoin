{ pkgs, buildGoModule, fetchurl, lib }:

buildGoModule rec {
  pname = "lightning-loop";
  version = "0.6.5-beta";

  src = fetchurl {
    url = "https://github.com/lightninglabs/loop/archive/v${version}.tar.gz";
    # Use ./get-sha256.sh to fetch latest (verified) sha256
    sha256 = "8b248fbfbdea06fe267895504ec4d7bda6da3e00387d001d227e693a87e7b851";
  };

  subPackages = [ "cmd/loop" "cmd/loopd" ];

  vendorSha256 = "1g0l09zcic5nnrsdyap40dj3zl59gbb2k8iirhph3257ysa52mhr";

  meta = with lib; {
    description = " Lightning Loop: A Non-Custodial Off/On Chain Bridge";
    homepage = "https://github.com/lightninglabs/loop";
    license = lib.licenses.mit;
    maintainers = with maintainers; [ nixbitcoin ];
  };
}
