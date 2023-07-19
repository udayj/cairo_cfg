#[starknet::interface]
trait IContract1<TContractState> {

    fn get_value(self: @TContractState) -> u32;
    fn store_value(ref self: TContractState, value: u32);

    #[cfg(test)]
    fn store_value_plus(ref self: TContractState, value1: u32, value2: u32);
}

#[starknet::contract]
mod contract1 {

    use super::IContract1;

    #[storage]
    struct Storage {
        value: u32
    }
    
    #[external(v0)]
    impl Contract1Impl of IContract1<ContractState> {

        fn get_value(self: @ContractState) -> u32 {

            self.value.read()
        }

        fn store_value(ref self: ContractState, value: u32) {
            self.value.write(value);
        }

        #[cfg(test)]
        fn store_value_plus(ref self: ContractState, value1: u32, value2: u32) {

            self.value.write(value1+value2);
        }
    }
}