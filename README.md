parent repository for all web services of Queerreferat Aachen

## How to work with this repository

Clone the repository to your computer. Since subdirectories like `proxy_docker` have their own repositories and are only linked to this one, the content of these are not automatically fetched to your pc. To fetch data of all the submodules in the first place run

```
git submodule update --init --recursive
```

When pulling make sure to add the `--recurse-submodules` to the `git pull` command.

You can cd into these subdirectories and work within them like you would on a single repository. Just make sure you always update the submodule beforehand and do not make changes inside `.gitmodules`.

## How to add a web service

1. create a new QuITAC-repository with the name of the web service
2. in the root `queerreferat_ac` repository, run

```
git submodule add <URL(http_or_ssh)_OF_THE_NEW_REPOSITORY>

```

## Tipps
the server user has an alias for `docker compose` called `dc`.


## Todos:
* before going into production we should check [this list](https://www.smarthomebeginner.com/traefik-docker-security-best-practices/) and check if we have implemented these. at the very least we should argue why skipping a step.