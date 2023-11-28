# Wordpress

Wordpress is a pain in the ass to setup with a script. Therefore automation is a pain in the ass.
Our solution is to document the steps for the setup thourughly.

## Initial Setup

Steps you need to take after your first login.

### 5 min installation process

On Initial setup you are greeted with wordpress '5-minute install process'.

1. Select "deutsch" (I know, I know)
2. fill in:
   1. uname: quitac
   2. email: <it@queerreferat-aachen.de>
   3. possibly change the pw (wp default suggestion is random and good)
3. note down the password !!!

### Link to SSO

Instructions taken from <https://goauthentik.io/integrations/services/wordpress/> on 24.11.23.

To install the necessary plugin:

1. Download the plugin from <https://wordpress.org/plugins/daggerhart-openid-connect-generic/>.
2. In the wp admin panel go to __plugins >> Neues Plugin hinzufügen__. Click on __Plugin hochladen__ and then on __Choose File__. Select the zipped folder you downloaded in the previous step.
3. Then click on __plugin aktivieren__.

Next got to authentik and create an oidc provider named wordpress. Ideally, this should have been configured beforehand. The important thing is, that you need the client ID and the client secret in the next steps. The redictect URI can be taken from __Einstellungen >> OpenID Connect Plugin__ in Worpdress.

1. Navigate in wordpress admin interface to __Einstellungen >> OpenID Connect Plugin__.
2. Enter the following info
   1. Anmeldetyp:  AUtomatische Anmeldung - SSO
   2. Client ID: Client ID from authentik
   3. Client Secret: Client Secret from authentik
   4. OpenID Scope: `email profile openid`
   5. Endpunkt-URL zur Anmeldung: <https://authentik.company/application/o/authorize/>
   6. Endpunkt-URL zur Benutzerinfo: <https://authentik.company/application/o/userinfo/>
   7. Endpunkt-URL zur Token-Verifizierung: <https://authentik.company/application/o/token/>
   8. Endpunkt-URL zum Sitzungsende: <https://authentik.company/application/o/wordpress/end-session/>
   9. Existierende Nutzer verknüpfen.
