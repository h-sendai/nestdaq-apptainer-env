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

### ROOTパッケージ全部インストール

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

nestdaqのセットアップ手順書は
https://docs.google.com/document/d/1LXQejEye76UJv8ahEP6n4tAMXi1fC9YXGf0zSLDs3NI/edit#
にある。

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

### fmtライブラリのコンパイル

下のnestdaq-user-implのコンパイルでfmtが必要になる。
以前はfmtはapptainerイメージに入れるようにしていたが、バージョンによる
齟齬が発生するらしいのでapptainerイメージには入れないようにした（が
nestdaq-user-implのコンパイルには必要）。

fmtlib.shの$HOMEを適当に書き換えて実行すればよい。
たとえば/home/sendai/fmtをHOMEに設定すると
``/home/sendai/fmt/include/``, ``/home/sendai/fmt/lib64/``ディレクトリができる。

nestdaq-user-implのコード内で``#include <fmt/core.h>``している箇所があるが
最近のfmtでは``core.h``はインストールされなくなったようなので
nestdaq-user-implのコードを変更するか、``fmt/include/fmt/core.h``を
手で(上の例だと)``/home/sendai/fmt/include/core.h``としてコピーしておく。

### nestdaq-user-implコンパイルテスト

ソースは
https://github.com/spadi-alliance/nestdaq-user-impl
にある。ROOTとuhbookが必要と書いてある。uhbookは下のコマンドで
git cloneしている。

上のnestdaq-user-implにあるビルドスクリプトを参考に下の
コマンドを実行する。$HOME/nestdaq以下に実行ファイルが
入るのでlddコマンドでライブラリがリンクされるかどうか確認する。

$HOME/fmt以下に``$HOME/fmt/include``、``$HOME/fmt/include``がある
場合を以下に示している。違う場合は適宜``-DCMAKE_PREFIX_PATH``を変更する。

```
# $HOME: /home/username

cd $HOME/src

rm -fr uhbook nestdaq-user-impl
rm -fr $HOME/nestdaq

mkdir -p $HOME/nestdaq
git clone https://github.com/spadi-alliance/uhbook
git clone https://github.com/spadi-alliance/nestdaq-user-impl

cd nestdaq-user-impl

cmake  -DCMAKE_INSTALL_PREFIX=$HOME/nestdaq \
               -DCMAKE_PREFIX_PATH="/opt/nestdaq;$HOME/src/uhbook;$HOME/fmt"\
               -B ./build     -S .
cd build
make
make install
```

### igalashi/userworksコンパイルテスト

ソースは
https://github.com/igalashi/userworks
にある。

- git clone https://github.com/igalashi/userworks.git
- cd userworks
- cmake -DCMAKE_INSTALL_PREFIX=/opt/nestdaq -B build -S .
- cd build
- make
- make install
