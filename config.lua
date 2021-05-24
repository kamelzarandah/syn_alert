Config = {}

Config.alerts = { 
    police = {
        command = "alertpolice",
        msg = "police help needed. check map for coords",
        deadcheck = false, -- only pass the command if the player is dead
        blip = {
            blipsprite = 2119977580,
            Name = 'Police Alert',
        }
    },
    medic = {
        command = "alertmedic",
        msg = "medic help needed. check map for coords",
        deadcheck = true, 
        blip = {
            blipsprite = 2119977580,
            Name = 'Police Alert',
        }
    },
    doctor = {
        command = "alertdoctor",
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