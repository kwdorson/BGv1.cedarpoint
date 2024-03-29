#define true 1
#define false 0

// -- GUI
#include "gui\_master.cpp"

class Maverick_TTM {
	class Config {
		keyCode = 2320;
		shift = true;
		ctrl = true;
	};

	class Actions {
		#include "configuration\actions.hpp"
	};

	class Levels {
		#include "configuration\levels.hpp"
	};

	class Perks {
		#include "configuration\perks.hpp"
	};
};
