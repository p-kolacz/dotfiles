-- Perun = require "perun"
Perun.add {

	-- Plugins ----------------------------------------------------------------
	{ "  Update plugins",              Pluger.update },
	{ "  Update plugins (debug)",      Pluger.debug_update },


	-- Files&Tabs -------------------------------------------------------------
	{ "  New file",                    "new" },
	{ "  New tab",                     "tabnew" },

	-- Windows ----------------------------------------------------------------
	{ "  Open quickfix",               "copen" },
	{ "  Close quickfix",              "cclose" },
}

