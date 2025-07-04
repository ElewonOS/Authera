#!/bin/bash
# Project: Authera Game Server Installer - ElewonOS
# Unturned Update Version: v0.0.1
# License: MIT, see LICENSE.md
# Website: https://elewon.net

# DO NOT EDIT THIS FILE
# https://elewon.net

#We pull the colour codes from this url.
source <(curl -sSL https://raw.githubusercontent.com/ElewonOS/Authera/refs/heads/main/beacol/color.sh)
#It reads as follows
source <(curl -sSL https://raw.githubusercontent.com/ElewonOS/Authera/refs/heads/main/repo/repo.sh)
#For convenience when developing the script, we pull things like file path etc. from the remote server.
#This allows simple development and quick position adjustments with a centralised system. You may want to update the file at this url during development.


#Error output
function handle_error {
    echo -e "${GRAY}[${YELLOW}ALERT${GRAY}] ${RED}ERROR: Command failed -> '${BASH_COMMAND}' (line: ${BASH_LINENO[0]})${RESET}"
}
trap handle_error ERR
set -e
#Error output FINISH



read -p "Should the Unturned server be updated? (Y/n):" unturned_update_server
lower_unturned_update=$(echo "$unturned_update_server" | tr '[:upper:]' '[:lower:]')

if [ "$lower_unturned_update" = "y" ]; then
#Unturned Server Update
echo -e "${GRAY}[${YELLOW}INFO${GRAY}] ${LAVENDER_GRAY}Updating Unturned Server...${RESET}"
sleep 1
$STEAMCMD_BASE_DIR/steamcmd.sh +login anonymous +app_update $GAME_APP_ID_UNTERMED +quit
sleep 1
echo -e "${GRAY}[${GREEN}OK${GRAY}] ${LAVENDER_GRAY}Unturned Server Update Complete...${RESET}"
#Unturned Server Update FINISH
elif [ "$lower_unturned_update" = "n" ]; then
echo -e "${GRAY}[${GREEN}OK${GRAY}] ${LAVENDER_GRAY}Server Update Cancelled.${RESET}"
exit 0
else
echo -e "${GRAY}[${YELLOW}INFO${GRAY}] ${LAVENDER_GRAY}You have made an invalid selection. Please enter Y(YES) or N(NO).${RESET}"
fi