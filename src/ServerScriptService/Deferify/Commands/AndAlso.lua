local self = {}

local Modules = script:FindFirstAncestorOfClass("ModuleScript").Modules
local FollowCommandChain = require(Modules.FollowCommandChain)
local WhichShould = require(script.Parent.WhichShould)

self.CanBeFollowedBy = WhichShould.CanBeFollowedBy

self.FunctionsAs = WhichShould.FunctionsAs

return self