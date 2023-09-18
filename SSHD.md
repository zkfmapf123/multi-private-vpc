# 기존에 SSH가 아닌 로그인방식으로 운용할 경우

## 1. 일단 SSH로 연결

```sh
    ssh -i {pem키 경로} ec2-user@{ip주소}
```

## 2. user 추가 및 password 설정

```sh
# sudo -i
# sudo adduser mooove
# sudo passwd mooove

Changing password for user abcde
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
```

## 3. user 추가

```sh

    cat /etc/passwd
    sudo chmod u+w /etc/sudoers
```

## 4. 유저에게 쓰기권한 추가

```sh
    sudo vi /etc/sudoers

    // ...
    mooove    ALL=(ALL)    ALL
```

## 5. sshd_config 파일 설정

```
    sudo vi /etc/ssh/sshd_config

    // ...
    PasswordAuthentication yes
```

## 6. 서비스 재시작

```sh
    sudo service sshd restart
```

## 7. 로그인

```sh
    ssh mooove@{ip주소}
```
