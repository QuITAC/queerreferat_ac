parent repository for all web services of Queerreferat Aachen

## How to work with this repository

Clone the repository to your computer. Since subdirectories like `proxy_docker` have their own repositories and are only linked to this one, the content of these are not automatically fetched to your pc. To fetch data of all the submodules in the first place run

```
git submodule update --init --recursive
```

To update the submodules to represent their current content on main, run

```
git submodule update --remote
```

Note that you have to repeat this each time before pushing or pulling.
On the other hand, you can cd into these subdirectories and work within them like you would on a single repository. Just make sure you always update the submodule beforehand and do not make changes inside `.gitmodules`.

## How to add a web service

1. create a new QuITAC-repository with the name of the web service
2. in the root `queerreferat_ac` repository, run

```
git submodule add <URL(http_or_ssh)_OF_THE_NEW_REPOSITORY>

```
