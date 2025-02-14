inspec_config="--backend=ssh \
               --host=127.0.0.1 \
               --port=$(grep Port ubuntu2004/vagrant_ssh-config | cut -d ' ' -f 4) \
               --user=vagrant \
               --password=vagrant"
alias inspec-devopsedu="inspec exec ${inspec_config}"
alias inspec-devopsedu-shell="inspec shell ${inspec_config}"
