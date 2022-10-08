FROM rust:latest as builder
WORKDIR /usr/sundry-rs

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y libssl-dev && \
    rustup toolchain add stable

COPY Cargo.toml .
COPY Cargo.lock .
COPY src ./src
RUN cargo build --release

FROM ubuntu:focal
COPY --from=builder /usr/sundry-rs/target/release/sundry-rs .

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y libssl-dev

USER 1000
CMD ["./sundry-rs"]
