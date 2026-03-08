{ ... }: {
  flake.nixosModules.apps-sys-onepassword = {
    programs._1password.enable = true;
    programs._1password-gui.enable = true;
    programs._1password-gui.polkitPolicyOwners = [ "mo" "deck" "nadine" ];
  };
}
