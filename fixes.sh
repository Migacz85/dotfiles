#Fixes

cat >>~/.bashrc <<EOL

 if [ -f ~/.bash_profile ]; then
 source ~/.bash_profile
 fi

EOL

sudo cat >~/etc/ssmtp/ssmtp.conf <<EOL
#
# /etc/ssmtp.conf -- a config file for sSMTP sendmail.
#
# The person who gets all mail for userids < 1000
# Make this empty to disable rewriting.
root=migacz85@gmail.com
# The place where the mail goes. The actual machine name is required
# no MX records are consulted. Commonly mailhosts are named mail.domain.com
# The example will fit if you are in domain.com and you mailhub is so named.
mailhub=smtp.gmail.com:587

# The address where the mail appears to come from for user authentication.
rewriteDomain=gmail.com

# The full hostname.  Must be correctly formed, fully qualified domain name or GMail will reject connection.
hostname=migacz.hp360.tld

# Use SSL/TLS before starting negotiation
TLS_CA_FILE=/etc/ssl/certs/ca-certificates.crt
UseTLS=Yes
UseSTARTTLS=Yes

# Username/Password
AuthUser=migacz85
AuthPass=***enter**yourpassword
AuthMethod=LOGIN

# Email 'From header's can override the default domain?
FromLineOverride=yes

EOL



# # Fix touchpad in i3
# sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
#             Section "InputClass"
#             Identifier "touchpad"
#             MatchIsTouchpad "on"
#             Driver "libinput"
#             Option "Tapping" "on"
#  EndSection
# EOF
# cat >/etc/asound.conf <<EOL
# pcm.bluetooth {
#     type bluetooth
#     device 68:DB:F5:5D:42:E2 # change this MAC address to the one you wrote down
# }
# EOL
