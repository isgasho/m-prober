EXE = ./target/release/magiclen-prober

all: $(EXE)

$(EXE): $(shell find . -type f -iname '*.rs' -o -name 'Cargo.toml' | sed 's/ /\\ /g')
	cargo build --release --target x86_64-unknown-linux-musl
	strip ./target/release/magiclen-prober
	
install:
	$(MAKE)
	sudo cp ./target/release/magiclen-prober /usr/local/bin/magiclen-prober
	sudo chown root. /usr/local/bin/magiclen-prober
	sudo chmod 0755 /usr/local/bin/magiclen-prober

test:
	cargo test --verbose

clean:
	cargo clean
