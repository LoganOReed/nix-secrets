# This file is not imported into your NixOS configuration. It is only used for the agenix CLI.
# agenix use the public keys defined in this file to encrypt the secrets.
# and users can decrypt the secrets by any of the corresponding private keys.

let
  # get user's ssh public key by command:
  #     cat ~/.ssh/id_ed25519.pub
  # if you do not have one, you can generate it by command:
  #     ssh-keygen -t ed25519
  occam = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK6sLwHf6YinWCrt0amlNhrWml3i+Vq7Ju1GcnAWd1zL";
  users = [ occam ];

  # get system's ssh public key by command:
  #    cat /etc/ssh/ssh_host_ed25519_key.pub
  ai = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPJucYK/TdGJqfqKhubugyx6L6N5RBXvBETJQ/ytLlmt";
  systems = [ ai ];
in
{
  "./occam-razor.age".publicKeys = users ++ systems;
}
