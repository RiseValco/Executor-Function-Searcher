local search = _G.Search or "all"

local function getexploit() --https://v3rmillion.net/showthread.php?tid=1027440
  local exploit =
      (syn and not is_sirhurt_closure and not pebc_execute and "Synapse X") or
      (secure_load and "Sentinel") or
      (is_sirhurt_closure and "Sirhurt") or
      (pebc_execute and "ProtoSmasher") or
      (KRNL_LOADED and "Krnl") or
      (WrapGlobal and "WeAreDevs") or
      (isvm and "Proxo") or
      (shadow_env and "Shadow") or
      (jit and "EasyExploits") or
      (getscriptenvs and "Calamari") or
      (unit and not syn and "Unit") or
      (OXYGEN_LOADED and "Oxygen U") or
      (IsElectron and "Electron") or
      ("Unsupported")
  return exploit
end

function searchF(q)
    local t = {}
    for _,v in pairs(getgenv()) do
       if string.find(_:lower(), q) and search:lower() ~= "all" then
           table.insert(t, _)
         elseif search:lower() == "all" then
           table.insert(t, _)
        end
    end
    return t
end
local subbed = search:sub(#search - #search * 0.5 , #search):lower()
local results = searchF(subbed)
rconsolename("FUNCTION SEARCHER | DLL "..getexploit().." | dsc.gg/grimcity | v0.0.2")
rconsoleclear()
rconsoleprint("@@GREEN@@")
rconsoleprint("-- [[ FOUND " .. #results .. ' FUNCTIONS FOR "'..search..'" ]] --\n')
for _,v in pairs(results) do
    rconsoleinfo(v)
end
