#[starknet::contract]
pub mod PiggyStark {
    use contracts::{
        interfaces::ipiggystark::IPiggyStark, 
        structs::piggystructs::Asset
    };
    use starknet::ContractAddress;
    use starknet::storage::{Map, StoragePathEntry, StoragePointerReadAccess, StoragePointerWriteAccess};
    #[storage]
    struct Storage {
       owner: ContractAddress,
       // Mapping from user address to the token address they deposited
        deposited_token: Map::<ContractAddress, ContractAddress>,
        // Mapping from (user address, token address) to deposit amount
        deposit_values: Map::<(ContractAddress, ContractAddress), u256>,
    }

    fn constructor(){

    }

    #[abi(embed_v0)]
    impl PiggyStarkImpl of IPiggyStark<ContractState> {
        fn deposit(ref self: ContractState, token_address: ContractAddress, amount: u256) {}
        fn withdraw(ref self: ContractState, token_address: ContractAddress, amount: u256) {}
        fn get_user_assets(self: @ContractState) -> Array<Asset> {}
        fn get_token_balance(self: @ContractState, token_address: ContractAddress) {}
    }
}