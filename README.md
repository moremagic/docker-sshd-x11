# docker-sshd-x11
Docker container with X11 forwerding enabled

## requwirement

- macOS 12.5
- DockerDesktop 4.12.0
- XQuartz 2.8.2

## quick start

1. XQuartz install
   ```
   brew reinstall --cask xquartz
   ```
2. Start XQuartz
3. Config setting for XQuartz
   - 環境設定 -> セキュリティ -> 接続を認証 のチェックを外す
   - 環境設定 -> セキュリティ -> ネットワーク・クライアントからの接続を許可 にチェックを入れる
4. Container start
   ```
   docker run -dP --rm --name my-container moremagic/docker-sshd-x11
   ```
5. ssh login and start X11 apps
   ```
   ssh -X -p $(docker port my-container 22|sed 's/.*://') root@localhost
   root@localhost's password: root

   xcalc
   ```

