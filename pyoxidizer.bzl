# This file defines how PyOxidizer application building and packaging is
# performed. See PyOxidizer's documentation at
# https://pyoxidizer.readthedocs.io/en/stable/ for details of this
# configuration file format.

def make_exe():
    dist = default_python_distribution(flavor = VARS["flavor"])

    policy = dist.make_python_packaging_policy()
    # policy.extension_module_filter = "minimal"
    policy.extension_module_filter = "no-copyleft"

    policy.resources_location = "in-memory"
    policy.resources_location_fallback = "filesystem-relative:prefix"

    python_config = dist.make_python_interpreter_config()

    # Evaluate a string as Python code when the interpreter starts.
    python_config.run_command = "from moosecli.__main__ import app; app()"

    # Produce a PythonExecutable from a Python distribution, embedded
    # resources, and other options. The returned object represents the
    # standalone executable that will be built.
    exe = dist.to_python_executable(
        name = "moosecli",
        packaging_policy = policy,
        config = python_config,
    )

    # Install pinned dependencies, then ourselves.
    # FIXME: Investigate the trick Hynek used here:
    exe.add_python_resources(exe.pip_install(["-r", "requirements/pyoxidizer-%s.txt" % VARS["platform"]]))
    # exe.add_python_resources(exe.pip_install(["-r", "requirements.txt"]))
    exe.add_python_resources(exe.pip_install(["."]))

    return exe

def make_embedded_resources(exe):
    return exe.to_embedded_resources()

def make_install(exe):
    # Create an object that represents our installed application file layout.
    files = FileManifest()

    # Add the generated executable to our install layout in the root directory.
    files.add_python_resource(".", exe)
    # thing = dist.pip_install(["black==19.3b0"])
    # files.add_python_resources(["moosecli/data/*.md", "moosecli/data/*.txt"])
    
    # files.add_python_resource(PythonPackageResource(package="moosecli", name="data/something.md", is_stdlib=False))

    return files


# Tell PyOxidizer about the build targets defined above.
register_target("exe", make_exe)
register_target("resources", make_embedded_resources, depends = ["exe"], default_build_script = True)
register_target("install", make_install, depends = ["exe"], default = True)

# Resolve whatever targets the invoker of this configuration file is requesting
# be resolved.
resolve_targets()
