------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-------------------
---- AUTOSTART ----
-------------------

require("lua.events")
-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
---- LOOK AND FEEL ----
-----------------------

require("lua.look")

require("lua.animations")

require("lua.layouts")

---------------
---- INPUT ----
---------------

require("lua.inputs")

---------------------
---- KEYBINDINGS ----
---------------------

require("lua.binds")
--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
require("lua.rules")
