{ ... }: {
  flake.nixosModules.hypervisor-sys-virtualization = { config, pkgs, ... }: {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    networking.firewall.trustedInterfaces = [ "virbr0" ];
    environment.systemPackages = with pkgs; [ 
      dnsmasq 
    ];
    users.users.mo.extraGroups = [ "libvirtd" ];
  };
}
