{ lib, ... }:
let
  defaultTrue = lib.mkDefault true;
in {
  services.tor = {
    enable = true;
    client.enable = true;
  };

  # Use Tor for all outgoing connections
  services = {
    bitcoind.enforceTor = true;
    clightning.enforceTor = true;
    lnd.enforceTor = true;
    lightning-loop.enforceTor = true;
    liquidd.enforceTor = true;
    electrs.enforceTor = true;
    # disable Tor enforcement until btcpayserver can fetch rates over Tor
    # btcpayserver.enforceTor = true;
    nbxplorer.enforceTor = true;
    spark-wallet.enforceTor = true;
    recurring-donations.enforceTor = true;
    lightning-pool.enforceTor = true;
  };

  # Add onion services for incoming connections
  nix-bitcoin.onionServices = {
    bitcoind.enable = defaultTrue;
    liquidd.enable = defaultTrue;
    electrs.enable = defaultTrue;
    spark-wallet.enable = defaultTrue;
    joinmarket-ob-watcher.enable = defaultTrue;
  };
}
