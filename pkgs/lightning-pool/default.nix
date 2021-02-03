{ pkgs, buildGoModule,fetchFromGitHub, fetchurl, lib }:

buildGoModule rec {
  pname = "lightning-pool";
  version = "sputn1ck-socks-proxy";

  # src = fetchurl {
  #   url = "https://github.com/lightninglabs/pool/archive/v${version}.tar.gz";
  #   # Use ./get-sha256.sh to fetch latest (verified) sha256
  #   sha256 = "0d4c36d119f5fc49cb56b107da46b28a3fd5bf0786c84d812a0c3b49f6f8a781";
  # };
   src = fetchFromGitHub {
      owner = "sputn1ck";
      repo = "pool";
      rev = "socks-proxy";
      sha256 = "1wjcl4l90r720pfvvg7r4vxhky1953hy353ygwg58xb48422lvap";
  };

  subPackages = [ "cmd/pool" "cmd/poold" ];

  vendorSha256 = "190qy3cz18ipv8ilpqhbaaxfi9j2isxpwhagzzspa3pwcpssrv52";

  meta = with lib; {
    description = "Lightning Pool: a non-custodial batched uniform clearing-price auction for Lightning Channel Leases (LCL)";
    homepage = "https://github.com/lightninglabs/pool";
    license = lib.licenses.mit;
    maintainers = with maintainers; [ sputn1ck ];
  };
}
