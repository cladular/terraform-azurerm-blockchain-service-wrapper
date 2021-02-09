# Azure Blockchain Transaction Node Module
Can be consumed from the `modules/azure-blockchain-transaction-node` subfolder. Can be used to create configurations for additional transaction nodes.

**Based on:** [Microsoft.Blockchain blockchainMembers/transactionNodes template reference](https://docs.microsoft.com/en-us/azure/templates/microsoft.blockchain/blockchainmembers/transactionnodes)

**Note:** The transaction node module only generates the configuration. The module instance needs to be later passed as a value to the `transaction_nodes` argument to the member module.

See [standard blockchain exmple](./examples/standard-blockchain).