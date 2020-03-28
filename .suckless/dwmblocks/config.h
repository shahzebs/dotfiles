//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
    {" ", "playback", 15, 3},
    {"", "weather", 900, 0},
    {"", "dropbx", 10, 0},
    {"", "cpuload", 3, 0},
    {"", "cputemp", 3, 0},
    {"", "memory", 5, 0},
    {"", "wifi", 10, 2},
    {"", "volume", 60, 1},
    {"", "iodevices", 10, 1},
    {"", "brightness", 0, 4},
    {"", "battery BAT0", 15, 0},
	{"", "datetime", 30, 0},

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '\0';
