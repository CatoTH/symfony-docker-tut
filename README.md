# Test Project



## Running

The docker build runs on arm64/aarch64 and x86_64 architectures.

Starting:
```sh
docker-compose up
```

After that, the following URL is accessible:

http://localhost:8080

## Testing

The test cases can be run using the following command:

```sh
docker-compose -f docker-compose.yml -f docker-compose.test.yml up --abort-on-container-exit
```


### Limitations

- docker-compose is used in a rudimentary way. Hard-coding the passwords there is not the way to go for going live :-)
- dev dependencies are installed, which would not make sense on a production build
- The composer install should not be in the entrypoint script. This is only necessary as we mount the local dev directory into the container for easier development, overwriting the vendor directory of the image.

### Sources / Acknowledgements

Base template: a modified version from https://github.com/yemiwebby/symfony-docker-tut

wait-for-it.sh taken from https://github.com/vishnubob/wait-for-it , MIT License