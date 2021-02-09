{
    "name": "${node_name}",
    "type": "Microsoft.Blockchain/blockchainMembers/transactionNodes",
    "apiVersion": "2018-06-01-preview",
    "properties": {
        "password": "${node_password}",
        "firewallRules": ${firewall_rules}
    },
    "dependsOn": [
        "Microsoft.Blockchain/blockchainMembers/${member_name}"
    ]
}