workspace "Vortex"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }


outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Vortex"
    location "Vortex"
    kind "SharedLib"
    language "C++"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
	   "%{prj.name}/src/**.cpp"
    }

    includedirs
	{
		"%{prj.name}/vendor/spdlog/include"
	}

    filter "system:windows"
        cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

        defines {
            "VX_PLATFORM_WINDOWS",
			"VX_BUILD_DLL"
        }
        
        postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

    filter "configurations:Debug"
        defines "VX_DEBUG"
		symbols "On"

    filter "configurations:Release"
		defines "VX_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "VX_DIST"
        optimize "On"

		
project "Sandbox"
    location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
	   "%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Vortex/vendor/spdlog/include",
		"Vortex/src"
	}

	links {
		"Vortex"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines {
			"VX_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "VX_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "VX_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "VX_DIST"
		optimize "On"