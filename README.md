# ubuntu-plus

[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/P3TERX/ubuntu-plus/blob/master/LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/P3TERX/ubuntu-plus.svg?style=flat-square&label=Stars)](https://github.com/P3TERX/ubuntu-plus/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/P3TERX/ubuntu-plus.svg?style=flat-square&label=Forks)](https://github.com/P3TERX/ubuntu-plus/fork)

[![Docker Pulls](https://img.shields.io/docker/pulls/p3terx/ubuntu-plus.svg?style=flat-square&label=Docker%20Pulls&color=orange)](https://hub.docker.com/r/p3terx/ubuntu-plus)
[![Docker Stars](https://img.shields.io/docker/stars/p3terx/ubuntu-plus.svg?style=flat-square&label=Docker%20Stars)](https://hub.docker.com/r/p3terx/ubuntu-plus)

Ubuntu image with some extra packages

## Usage

### Pull image

```shell
docker pull p3terx/ubuntu-plus:18.04
```

### Run container

```shell
docker run -itd \
    --name ubuntu-plus \
    -h P3TERX \
    -p 10022:22 \
    p3terx/ubuntu-plus:18.04
```

### Enter container

- Enter from the host.
  
  ```shell
  docker exec -it ubuntu-plus zsh
  ```

- Connect via SSH.
  
  ```shell
  ssh user@IP -p 10022
  ```

## License

[MIT](https://github.com/P3TERX/ubuntu-plus/blob/master/LICENSE) © P3TERX
