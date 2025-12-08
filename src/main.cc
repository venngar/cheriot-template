// Copyright CHERIoT Contributors
// SPDX-License-Identifier: CC0-1.0

#include <compartment.h>
#include <cstdint>
#include <debug.hh>
#include <fail-simulator-on-error.h>

/// Expose debugging features unconditionally for this compartment.
using Debug = ConditionalDebug<true, "Empty Project compartment">;

/// Thread entry point.
void __cheri_compartment("entry_point") init()
{
    Debug::log("Hello, world!");
}
