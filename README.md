# sundry-rs

A toy project written in Rust and [tide](https://github.com/http-rs/tide).

## sundry?

Because this puppy is going to contain and produce some utter nonsense.

## Usage

```bash
# build image
docker build -t sundry-rs .

# start server
docker run -d --rm -p 8080:8080 --name sundry-rs sundry-rs

# test
curl localhost:8080/healthz
# you should see UP in your console

# log (ctrl+c to stop viewing)
docker logs -f sundry-rs

# stop server
docker stop sundry-rs
```
