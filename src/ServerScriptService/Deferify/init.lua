local Modules = script.Modules
local FollowCommandChain = require(Modules.FollowCommandChain)

return function(...)
	return FollowCommandChain({"Run"}).Run(...)
end