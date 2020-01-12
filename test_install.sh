#!/bin/bash
mkdir install_tests &&
single_source code src/install.md install_tests/linux.sh bash linux &&
single_source code src/install.md install_tests/windows.ps1 powershell &&
single_source code src/install.md install_tests/enter.sh bash enter &&
single_source code src/install.md install_tests/nix.sh bash nix &&
cd install_tests &&
printf '%s\n%s\n' "$(cat linux.sh)" "./enter.sh" >linux.sh &&
printf '%s %s\n' "$(cat enter.sh)" "--run ../check_install.sh" >enter.sh &&
sed -i -e '$ ! s/$/ \&\&/' linux.sh &&
sed -i -e '$ ! s/$/ \&\&/' nix.sh  &&
printf '%s\n%s\n' "#!/bin/bash" "$(cat linux.sh)" >linux.sh &&
printf '%s\n%s\n' "#!/bin/bash" "$(cat enter.sh)" >enter.sh &&
printf '%s\n%s\n' "#!/bin/bash" "$(cat nix.sh)" >nix.sh &&
chmod 755 linux.sh && 
chmod 755 enter.sh && 
chmod 755 nix.sh &&
./linux.sh
