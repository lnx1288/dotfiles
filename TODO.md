## TO-DO list

### Roles
  
  * Firefox:
    * Tweak a bit more the user preferences (hardening?), check [this repo](https://github.com/juju4/ansible-firefox-config)
    * Mark profile as Default
    * Enable installed extensions
  * Chrome:
    * Fix bookmark import
  * VSCodium:
    * VSCodium role CI checks are not working due to GH actions use of
root user. So far `ignored_errors` didn't work nor OR'ing to /bin/true
as a forceful bypass. Need to figure this one out.

