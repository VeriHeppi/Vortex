#pragma once

#include "stdio.h"

#ifdef VX_PLATFORM_WINDOWS

extern Vortex::Application* Vortex::CreateApplication();

int main(int argc, char** argv) {

	Vortex::Log::Init();
	VX_CORE_WARN("Initialized Log!");
	int a = 3;
	VX_INFO("Hello! Var={0}", a);

	printf("Vortex Engine!\n");
	auto app = Vortex::CreateApplication();
	app->Run();
	delete app;
}

#endif