{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {},
    "variables": {},
    "resources": [
        {
            "type": "Microsoft.Blockchain/blockchainMembers",
            "apiVersion": "2018-06-01-preview",
            "name": "${member_name}",
            "location": "${location}",
            "sku": {
                "name": "${sku_name}",
                "tier": "${sku_tier}"
            },
            "properties": {
                "protocol": "${protocol}",
                "validatorNodesSku": {
                    "capacity": ${capacity}
                },
                "password": "${member_password}",
                "consortium": "${consortium_name}",
                "consortiumManagementAccountPassword": "${consortium_management_account_password}",
                "consortiumRole": "${consortium_role}",
                "consortiumMemberDisplayName": "${consortium_member_display_name}",
                "firewallRules": ${firewall_rules}
            },
            "resources": ${transaction_nodes}
        }
    ]
}