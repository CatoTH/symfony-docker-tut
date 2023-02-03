## Test Project



### Running

The docker build runs on arm64/aarch64 and x86_64 architectures.

Starting:
```sh
docker-compose up
```

After that, the following URL is accessible:

http://localhost:8080


### Limitations

- docker-compose is used in a rudimentary way. Hard-coding the passwords there is not the way to go for going live :-)


### Sources / Acknowledgements

Base template: a modified version from https://github.com/yemiwebby/symfony-docker-tut

wait-for-it.sh taken from https://github.com/vishnubob/wait-for-it , MIT License