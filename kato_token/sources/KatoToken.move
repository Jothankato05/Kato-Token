module kato_token::KatoToken {

    use sui::transfer;
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;

    struct Kato has key {
        id: UID,
        value: u64,
    }

    public fun mint(context: &mut TxContext): Kato {
        let id = transfer::new_uid(context);
        Kato {
            id,
            value: 1000000, // initial supply
        }
    }

    public fun transfer_token(token: &mut Kato, to: address, context: &mut TxContext) {
        transfer::transfer(to, token, context);
    }

    public fun get_value(token: &Kato): u64 {
        token.value
    }
}

