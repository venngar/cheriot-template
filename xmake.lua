-- Copyright CHERIoT Contributors
-- SPDX-License-Identifier: CC0-1.0

set_project("Empty Project template")

sdkdir = path.absolute("third_party/cheriot_rtos/sdk")

set_toolchains("cheriot-clang")

includes(sdkdir)
includes(path.join(sdkdir, "lib"))

option("board")
    set_default("sail")

compartment("entry_point")
    add_deps("debug",
             "freestanding",
             "stdio")
    add_files("src/main.cc")

firmware("empty-project")
    add_deps("entry_point")
    on_load(function(target)
        target:values_set("board", "$(board)")
        target:values_set("threads", {
            {
                compartment = "entry_point",
                priority = 1,
                entry_point = "init",
                stack_size = 0x1000,
                trusted_stack_frames = 2
            }
        }, {expand = false})
    end)
