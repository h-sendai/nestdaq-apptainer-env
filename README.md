# nestdaq Apptainer Environment

apptainerコンテナにnestdaq開発環境をセットする。

ファイル

- almalinux9-nestdaq.def
- all.sh

```
apptainer build --sandbox almalinux9-nestdaq almalinux9-nestdaq.def
```

でalmalinux9-nestdaqというディレクトリができ、そのなかに
AlmaLinux 9の開発環境がセットされる。

```
apptainer shell --writable --fakeroot almalinux9-nestdaq
```

でコンテナ環境に入る。自分のホームディレクトリは/rootにマウント
されている状態になっている。

```
cd /root
ここで自分のホームディレクトリに移動するので
適当にsrcとかいうディレクトリを作ってそのなかで
このリポジトリをcloneしておく
```
mkdir src
cd src
git clone https://github.com/h-sendai/nestdaq-apptainer-env.git
cd nestdaq-apptainer-env
./all
```
とするとよい（のではないか）。
