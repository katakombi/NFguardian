# AntipornRouter-Light

Description

OpenWrt setup for wifi router TP-WR 1043 ND v1 customized to block out malicious sites (ads/porn/...)

Details
* sites are being blocked through DNS using host files 
* all DNS queries are redirected to the locally running dnsmasq server
* it is still possible to access blocked sites through their IP or via tunneling
* the host list for ads is dynamically updated (startup script on boot)
* the host list for porn is static as of now (see TODO)

TODO
* Find a reliable web resource for a porn/adult host file with maximum size ~2MB, or find a safe way to prune huge blacklists locally to a smaller one.
