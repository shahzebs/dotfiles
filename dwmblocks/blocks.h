//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
    {" ", "$HOME/.scripts/statusbar/playback", 15, 3},
    // {"", "$HOME/.scripts/statusbar/bluetooth", 10, 0},
    {"", "$HOME/.scripts/statusbar/dropbx", 10, 0},
    {"", "$HOME/.scripts/statusbar/cpu_temp", 3, 0},
    {"", "$HOME/.scripts/statusbar/memory", 5, 0},
    {"", "$HOME/.scripts/statusbar/wifi", 10, 2},
    {"", "$HOME/.scripts/statusbar/volume", 0, 1},
    {"", "$HOME/.scripts/statusbar/iodevices", 10, 1},
	{"", "$HOME/.scripts/statusbar/date", 30, 0},

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '\0';