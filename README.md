# CHERIoT Project Template

A simple starting point for writing CHERIoT applications.
It works inside the official CHERIoT development container and uses XMake together with the CHERIoT RTOS and SDK.

### 1. Create a New Project from This Template

Clone the template into a folder of your choice, for example *my project*:

```
git clone https://github.com/cheriot-platform/cheriot-template my-project
cd my-project

git submodule update --init --recursive
```

This creates your own project folder and pulls in the RTOS and SDK.

### 2. Open the Project in the CHERIoT Development Container

If you use Visual Studio Code, you will be asked whether you want to open the folder in the container. Say yes. The container provides the compiler, the tools and XMake.

### 3. Tell XMake Where the CHERIoT Tools Are

Run this inside the container to point XMake at the toolchain:

```
xmake f --sdk=/cheriot-tools
```

The toolchain is mounted at */cheriot-tools*.
You only need to run this again if you remove your build directory.

### 4. Build Your Project

This builds the example program included with the template:

```
xmake
```

The output appears in the *build* folder.

### 5. Run or Flash

To run the program in the CHERIoT emulator:

```
xmake run
```

For physical hardware such as Sonata, follow the flashing instructions in the CHERIoT documentation and use the files in your *build* folder.

### Adding Your Own Code

The *src* folder contains one file named *main.cc*. You can edit this file directly or replace it with your own.
If you want to add more files, place them in *src* and list them in *xmake.lua*. The provided *xmake.lua* is intentionally small so it is easy to expand.

### Updating the RTOS and SDK

Both are git submodules, so you can update them at any time:

```
git submodule update --remote
```

Then rebuild the project.

---

## Licence

This template is released under CC0. You may use it freely in any project.
Third party software included through submodules uses its own licences.
