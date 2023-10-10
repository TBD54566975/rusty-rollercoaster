uniffi::include_scaffolding!("rust-core");

use rand::Rng;

pub fn generate_random_num(min: i32, incl_max: i32) -> i32 {
    let mut rng = rand::thread_rng();
    rng.gen_range(min..=incl_max)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_generate_random_num() {
        let min = 5;
        let max = 10;
        let result = generate_random_num(min, max);
        assert!(result >= min && result <= max);
    }
}
