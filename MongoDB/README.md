# MongoDB

## Admin user creation

1. Run INSTALL.sh as root
2. This code 👇 can't be embed into Bash script, so you need to run one line at a time inside MongoDB Shell (you can launch that shell writing **mongo** into your CLI).

```bash
# Enter admin DB
use admin
# Create user. More info https://www.mongodb.com/docs/manual/reference/method/db.createUser/
db.createUser(
  {
    user: "admin",
    pwd: "test1234",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)
# Quit MongoDB Shell (or do CTRL + C)
quit()
# Re-login with newly created user
mongo -u admin -p --authenticationDatabase admin
# Select admin's DB
use admin
# Show users of that DB. You will see "admin" user there
db.system.users.find().pretty()
```

