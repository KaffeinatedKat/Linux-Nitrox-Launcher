#Clone Subnautica's Compatdata path for Nitrox to run in
cp -r ~/.local/share/Steam/steamapps/compatdata/264710 ~/.local/share/Steam/steamapps/compatdata/NitroxLauncher || failed=1

if [[ $failed == 1 ]]; then
  echo -e "\e[31mPlease install Subnautica in the deafult steam directory and run it at least once\e[0m" && exit 1
fi

export STEAM_COMPAT_DATA_PATH=~/.local/share/Steam/steamapps/compatdata/NitroxLauncher
export STEAM_COMPAT_CLIENT_INSTALL_PATH=~/.local/share/Steam
launcherpath=~/.steam/steam/steamapps/compatdata/264710/pfx/drive_c/users/steamuser/AppData/Roaming/Nitrox

#Create the Nitrox directory if it doesnt exist
mkdir -p $launcherpath

#Create the launcherpath.txt file so Subnautica can locate and load Nitrox
echo $(dirname $(readlink -f $0)) > $launcherpath/launcherpath.txt

#Create path.exe and put Subnautica's path into it (removes a step in the Nitrox Launcher)
echo ~/.steam/steam/steamapps/common/Subnautica > $(dirname $(readlink -f $0))/path.txt


#Start the Nitrox Launcher with Proton
~/.steam/steam/steamapps/common/Proton\ 6.3/proton run NitroxLauncher.exe || proton=1

#If the above command failed prompt user to install Proton 6.3
if [[ $proton == 1 ]]; then
  xdg-open steam://install/1580130
  sleep 1
  echo -e "\e[31mProton 6.3 Not Found. Install it to the default steam directory\nPress any key when it finishes downloading\e[0m"
  read -n 1 -s -r -p ""
  ~/.steam/steam/steamapps/common/Proton\ 6.3/proton run NitroxLauncher.exe
fi
