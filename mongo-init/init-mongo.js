db.createUser(
        {
            user: "remapuser",
            pwd: "remappwd",
            roles: [
                {
                    role: "readWrite",
                    db: "hsap_remap_2020"
                }
            ]
        }
);