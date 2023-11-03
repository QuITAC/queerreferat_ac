# How to help us

Ask Max (@DSMaVie) for server access. Until further don't do anything permanent on the servers as this is still early in development we have to expect to nuke them at any second.

## Rules

* Please document your work either in tickets on github or on via markdown or in the t-tech channel on our slack.
* Coordinate with others so there are no collisions when pushing.
* If possible create a new branch for every feature/ticket you work on an push only into main when ready.
  * Bonus points for PRs with a reviewer (could be any other team member)

## Docker Compose

A small hints for docker compose. Every user has a function called `dc`. This is a shorthand for `docker compose`, i.e. instead of `docker compose up` you can simply do `dc up`.

When testing the service and not the container you can start the service and regain your console at the same time with `dc up -d`. afterwards you can still see the logs with `dc logs`.

Remember to `dc down`. This frees up resources a simple CRTL-C on a running `dc up` does not free.
