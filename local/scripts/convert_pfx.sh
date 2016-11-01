#! /bin/bash
#
# Connect to EAP-TLS network using pfx certificate
#
# Step1:
#   run script on your pfx file for conversion to required pem files
#
# Step2:
#   In network-manager (nm-applet) under Wi-Fi Security tab select:
#
#     WPA & WPA2 Enterprise
#     TLS
#     <username>
#     cert.pem
#     cacert.pem
#     key.pem
#     <passkey>

if [ $# -ne 1 ]; then
    echo "Invalid call"
    echo -e "\n"
    echo "<script> <cert>"
    echo -e "\tcert: exported pfx certificate"
    exit -1
fi

echo ""
echo "> Export CA certificate"
openssl pkcs12  -in $1  -out cacert.pem -cacerts -nokeys

echo ""
echo "> Export user certificate"
openssl pkcs12  -in $1 -out cert.pem -clcerts -nokeys

echo ""
echo "> Export user key (passkey is required)"
openssl pkcs12  -in $1 -out key.pem -nocerts
