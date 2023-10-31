# Development Plan

QuITAc decided to structure the development of the Queerreferats digital resources.
The following graph shows the subphases or steps per phase

```mermaid
timeline
    title QuITAc Dev Plan
    section Phase 1 <br> Refcloud and Website
        Gathering Requirements: internal and external gathering process through team meetings, and informal questions to users
        Analysis and Design: Analyzing the gathered requirements and analyzing which products are compatible as well as easy to maintain
        Development: writing reproducible docker builds, starting internal tech team documentation, bash scripting
        Testing in the Large: gathering feedback from future users and implementing changes to internal workflows relying on technical tools on a reversible basis
        Productionalization: Bringing the Codebase into a state makes it easy to maintain and hand over to new maintainers
    section Phase 2 <br> Improvements to Cloud and Automations
        No plans yet
    section Phase 3 <br> Slack alternative
        No plans yet
```

We are currently in phase 1, sub-phase 3 (development).
In subphase 1 we have gathered the following feedback externally and internally:

* SSO solution
* new Website with user-friendly backend
* Cloud including Groupware
* Data security and privacy
* Extensibility

This can be translated to the following technical requiments

* FOSS where possible
* Reproducability and automation where possible
* good documentation
* Multistage backups
* build with extending the feature set in future in mind
* using well-maintained products

This has led us to the following design decisions in subphase 2:

* Hosting on. Hetzner
* well-liked
* works with docker even behind virtualization
* fair prizes
* need data addendum to our data agreements with users (negative, but manageable)
* Cloud based on Nextcloud
* Easy to integrate/ ready-made groupware and add-ons
* supports common sso standards
* self-hostable
* SSO by Authentik
* integrates well with nextcloud
* new, stylish and covers a lot of technical cases
* user-friendly interface included, but also scriptable/configurable through cli
* Traefik Reverse Proxy
  * ingenious integration into docker
* well-maintained, well-liked
* secure
* integrates well with authentik as path authenticator
* Wordpress for Website
* old-ish design, php-based (negative point)
* best supported FOSS CMS
* easy to use user-wise
* good extensive documentation
* plethora of themes, workable for us to translate external themes (ivana)

We can therefore project the following base architecture on hetzner servers:

```mermaid
flowchart LR
 traefik(traefik)
 authentik(authentik)
 nextcloud(nextcloud)
 wordpress(wordpress)

 traefik <--> authentik
 User:::hidden -- users --> traefik
 traefik --> wordpress
 authentik -. internal users .-> nextcloud
 traefik -- publicly shared resources --> nextcloud
 authentik  -.  website admins.-> wordpress
```
