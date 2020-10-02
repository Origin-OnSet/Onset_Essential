GROUP_LIST = {
    Administrator = {
        default = false,
        prefixChat = '<span style="bold">[</><span style="bold" color="#E74C3C">Administrator</><span style="bold">]</>',
        permission = {
            "essential.ban",
            "essential.unban"
        },
        inheritance = "Moderator"
    },
    Moderator = {
        default = false,
        prefixChat = '<span style="bold">[</><span style="bold" color="#F4D03F">Moderator</><span style="bold">]</>',
        permission = {
            "essential.unban"
        },
        inheritance = "Helper"
    },
    Helper = {
        default = false,
        prefixChat = '<span style="bold">[</><span style="bold" color="#1ABC9C">Helper</><span style="bold">]</>',
        permission = {
            "essential.banip"
        },
        inheritance = "VIP"
    },
    VIP = {
        default = false,
        prefixChat = '<span style="bold">[</><span style="bold" color="#DC7633">VIP</><span style="bold">]</>',
        permission = {
            "essential.kick"
        },
        inheritance = "Player"
    },
    Player = {
        default = true,
        prefixChat = '<span style="bold">[</><span style="bold" color="#3498DB">Player</><span style="bold">]</>',
        permission = {
            "essential.kickall"
        },
        inheritance = ""
    }
}