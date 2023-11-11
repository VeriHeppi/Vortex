#include <Vortex.h>

class Sandbox : public Vortex::Application {
public:
	Sandbox() {
		
	}
	~Sandbox() {
		
	}
	
};

Vortex::Application* Vortex::CreateApplication() {
	return new Sandbox();
}