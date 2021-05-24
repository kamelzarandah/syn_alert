local cooldown = false 
local timer = Config.alertcooldown
local blips = {}

function GetPlayers()
	local players = {}
	for i = 0, 256 do
		if NetworkIsPlayerActive(i) then
			table.insert(players, GetPlayerServerId(i))
		end
	end
	return players
end

Citizen.CreateThread(function()
    for k,v in pairs(Config.alerts) do 
        RegisterCommand(v.command, function(source, args, rawCommand)
            if v.deadcheck then 
                if IsEntityDead(PlayerPedId())
                    v.blip.coords = GetEntityCoords(PlayerPedId())
                    TriggerServerEvent("syn_alert:sendalert",GetPlayers(),v.jobs,v.msg,v.blip)
                    cooldown = true
                end
            else
                v.blip.coords = GetEntityCoords(PlayerPedId())
                TriggerServerEvent("syn_alert:sendalert",GetPlayers(),v.jobs,v.msg,v.blip)
                cooldown = true
            end
        end, false)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
	    if timer >= 0 and cooldown then
	    	Citizen.Wait(1000)
	    	if timer > 0 then
	    		timer = timer - 1
	    	end
            if 0 >= timer and cooldown then 
                cooldown = false 
                timer = Config.racestartdelay
            end
	    end
    end
end)

RegisterNetEvent("syn_alert:createblip")
AddEventHandler("syn_alert:createblip", function(blip)
    local blip =  N_0x554d9d53f696d002(1664425300, blip.coords.x, blip.coords.y, blip.coords.z)
    SetBlipScale(blip, 0.2)
    SetBlipSprite(blip, blip.blipsprite, 1) 
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, blip.Name)
    Citizen.InvokeNative(0x662D364ABF16DE2F,blip,0x6F85C3CE)
    table.insert(blips, {
      blipz = blip
    })
end)

RegisterCommand(Config.cancelblipcommand, function(source, args, rawCommand)
    for k,v in pairs(blips) do 
        RemoveBlip(v.blipz)
    end
    blips = {}
end, false)