{ pkgs }: with pkgs;

let
rpcauth = pkgs.callPackage ./rpcauth { };
in
writeScript "generate-secrets" ''
  export PATH=${lib.makeBinPath [ coreutils apg openssl gnugrep rpcauth python35 ]}
  . ${./generate-secrets.sh} ${./openssl.cnf}
''
