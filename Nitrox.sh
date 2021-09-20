#Clone Subnautica's Compatdata path for Nitrox to run in
cp -r ~/.local/share/Steam/steamapps/compatdata/264710 ~/.local/share/Steam/steamapps/compatdata/NitroxLauncher

export STEAM_COMPAT_DATA_PATH=~/.local/share/Steam/steamapps/compatdata/NitroxLauncher
export STEAM_COMPAT_CLIENT_INSTALL_PATH=~/.local/share/Steam
launcherpath=~/.steam/steam/steamapps/compatdata/264710/pfx/drive_c/users/steamuser/AppData/Roaming/Nitrox

#Create the Nitrox directory if it doesnt exist
mkdir -p $launcherpath

#Create the launcherpath.txt file so Subnautica can locate and load Nitrox
echo $(dirname $(readlink -f $0)) > $launcherpath/launcherpath.txt

#Start the Nitrox Launcher with Proton
~/.steam/steam/steamapps/common/Proton\ 6.3/proton run NitroxLauncher.exe
