Config = {}

Config.alerts = { 
    police = { -- job name
        command = "alertpolice",
        jobs = {"police","police2"}, -- jobs the alert is sent to
        msg = "police help needed. check map for coords", -- alert sent to the players with the job name 
        deadcheck = false, -- only pass the command if the player is dead
        blip = {
            blipsprite = 2119977580,
            Name = 'Police Alert',
        }
    },
    medic = {
        command = "alertmedic",
        jobs = {"medic"},
        msg = "medic help needed. check map for coords",
        deadcheck = true, 
        blip = {
            blipsprite = 2119977580,
            Name = 'Police Alert',
        }
    },
    doctor = {
        command = "alertdoctor",
        jobs = {"medic","doctor"},
        msg = "doctor help needed. check map for coords",
        deadcheck = true, 
        blip = {
            blipsprite = 2119977580,
            Name = 'Police Alert',
        }
    },
}

Config.cancelblipcommand = "calert" -- removes alert blips
Config.alertcooldown = 60 -- seconds