local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()


RegisterServerEvent("syn_alert:sendalert")
AddEventHandler("syn_alert:sendalert", function(players, job,alert,blip)
    local _source = source
    for z, m in pairs(players) do
        local User = VorpCore.getUser(m)
        local used = User.getUsedCharacter
        for k,v in pairs(job) do 
            if used.job == v then
                TriggerClientEvent("vorp:TipRight", m, alert , 50000)
                TriggerClientEvent("syn_alert:createblip",m,blip)
            end
        end
    end 
end)