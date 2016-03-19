# NFguardian

Description

OpenWrt setup for wifi router Linksys WRT1200 AC customized to block out malicious sites (ads & porn)

Details
* sites are being blocked through DNS using host files 
* all DNS queries are redirected to the locally running dnsmasq server
* it is still possible to access blocked sites through their IP or via tunneling
* the host list for ads is dynamically updated (startup script on boot)
* the host list for porn is static as of now
* PLANNED: use web host lists
* PLANNED: use transparent pixel support (no error msgs for ads and blocked sites)
* PLANNED: use e2guardian/dansguardian for better blockage
* PLANNED: integrate syncthing for file sharing
