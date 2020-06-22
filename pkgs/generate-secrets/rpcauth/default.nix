{pkgs}:

with pkgs;
stdenv.mkDerivation {
  name = "rpcauth";
  unpackPhase = "true";
  installPhase = ''
    mkdir -p $out/bin
    cp ${./rpcauth.py} $out/bin/rpcauth
    chmod +x $out/bin/rpcauth
  '';
}
