#pragma once

#include "stdio.h"

#ifdef VX_PLATFORM_WINDOWS

extern Vortex::Application* Vortex::CreateApplication();

int main(int argc, char** argv) {
	printf("Vortex Engine!\n");
	auto app = Vortex::CreateApplication();
	app->Run();
	delete app;
}

#endif