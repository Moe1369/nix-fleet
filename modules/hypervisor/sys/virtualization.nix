{ ... }: {
  flake.nixosModules.hypervisor-sys-virtualization = { config, pkgs, user, ... }: {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    networking.firewall.trustedInterfaces = [ "virbr0" ];
    environment.systemPackages = with pkgs; [ 
      dnsmasq 
    ];
    users.users.${user}.extraGroups = [ "libvirtd" ];
  };
}
