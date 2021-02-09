# Azure Blockchain Service Wrapper Module
A module that wraps the Azure Resource Manager's Azure Blockchain templates.
This module is intended for use while there is no official resource avaialable through the Azure Terraform provider, probably due to the fact that Azure Blockchain Service is still in preview at this time.


## Templates Reference
The module is based on the following Azure Resource Manager Templates:
- Member module: [Microsoft.Blockchain blockchainMembers template reference](https://docs.microsoft.com/en-us/azure/templates/microsoft.blockchain/blockchainmembers)
- Transaction node module [Microsoft.Blockchain blockchainMembers/transactionNodes template reference](https://docs.microsoft.com/en-us/azure/templates/microsoft.blockchain/blockchainmembers/transactionnodes)

## Included Modules
### Main Module
Can be consumed from the root of this repository. Creates a Basic tier Azure Blockchain service with one validator node and one transaction node.
See [basic blockchain exmple](./examples/basic-blockchain).
### Azure Blockchain Member Module
Can be consumed from the `modules/azure-blockchain-member` subfolder. Can be used to create both basic and standard tier Azure Blockchain services, and when combined with the **Azure Blockchain Transaction Node** module, can deploy the service with multiple transaction nodes.

See [standard blockchain exmple](./examples/standard-blockchain).

### Azure Blockchain Transaction Node Module
Can be consumed from the `modules/azure-blockchain-transaction-node` subfolder. Can be used to create configurations for additional transaction nodes.

**Note:** The transaction node module only generates the configuration. The module instance needs to be later passed as a value to the `transaction_nodes` argument to the member module.

See [standard blockchain exmple](./examples/standard-blockchain).