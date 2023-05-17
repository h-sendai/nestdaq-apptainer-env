# nestdaq Apptainer Environment

apptainerコンテナにnestdaq開発環境をセットする。

## OSの準備

ファイル

- almalinux9-nestdaq.def

```
apptainer build --sandbox almalinux9-nestdaq almalinux9-nestdaq.def
```

でalmalinux9-nestdaqというディレクトリができ、そのなかに
AlmaLinux 9の開発環境がセットされる。

### ROOT全部入り

ROOTのrpmパッケージはEPELにある。
100以上のパッケージに分割されている。
一括してインストールするにはCRBリポジトリ（CodeReady Linux Builder。
Red Hatが決めた開発者用追加パッケージリポジトリ）を有効にしておく
必要がある。

```
dnf install epel-release
dnf update epel-release
dnf config-manager --enable crb
dnf -y install root 'root-*'
```

今後CRBリポジトリを使わない場合はdnf install時に
``--enablerepo``を付けて

```
dnf -y --enablerepo=crb install root 'root-*'
```
とする手もある。

## nestdaqのセットアップ

```
apptainer shell --writable --fakeroot almalinux9-nestdaq
```

でコンテナ環境に入る。自分のホームディレクトリは/rootにマウント
されている状態になっている。

```
cd /root
```
ここで自分のホームディレクトリに移動するので
適当にsrcとかいうディレクトリを作ってそのなかで
このリポジトリをcloneしておく
```
mkdir src
cd src
git clone https://github.com/h-sendai/nestdaq-apptainer-env.git
cd nestdaq-apptainer-env
./all.sh
```
とするとよい（のではないか）。

## 準備後の確認

sifファイルに固定して確認する。

```
apptainer build --fakeroot almalinux9-nestdaq.sif almalinux9-nestdaq
```
これでalmalinux9-nestdaq.sifができるので起動してみる:
```
apptainer shell almalinux9-nestdaq.sif
```

これで/home/youにホームディレクトリがマウントされている状態になっているので
適当なディレクトリを作って以下のテストを行う。

### nestdaq-user-implコンパイルテスト

ソースは
https://github.com/spadi-alliance/nestdaq-user-impl
にある。

- git clone https://github.com/spadi-alliance/nestdaq-user-impl.git
- cd nestdaq-user-impl
- cmake -DCMAKE_INSTALL_PREFIX=/home/nestdaq/nestdaq -B build -S .
- cd build
- make
- make install

### igalashi/userworksコンパイルテスト

ソースは
https://github.com/igalashi/userworks
にある。

- git clone https://github.com/igalashi/userworks.git
- cd userworks
- cmake -DCMAKE_INSTALL_PREFIX=/home/nestdaq/nestdaq -B build -S .
- cd build
- make
- make install
