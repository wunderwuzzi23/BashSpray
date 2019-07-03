# BashSpray
Password Spray Testing Tool in Bash

This is quick password spray testing tool for Active Directory to run tests from MacOS (or Linux). It's really only been tested on Mac so far - so there might be slight adjustments needed to run it from Linux. It's pretty slow and sequential (on purpose) but it works quite well to help secure things.

* To test credentials and authenticate to Active Directory it simply uses the *ldapwhoami* command.
* Whenever there is a hit, it can send a notification email also.
* reads passwords and user list from two input files

**Note:** As always, any kind of security/penetreation testing requires authorization of proper stakeholders beforehand.
