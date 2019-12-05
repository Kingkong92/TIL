# Git

> Git은 분산형 버전 관리 시스템(DVCS)이다.
> 소스코드 형상 관리 도구로, 코드의 이력을 관리 할 수 있다.

## Git 로컬 저장소 활용하기

> Git은 `repository(저장소)`로 각각 프로젝트를 관리 한다.



### 0. 기본설정

Git에서 이력을 남기기 위해 작성자(author) 정보를 추가한다. 매 컴퓨터에서 최초로 한 번만 설정 하면 된다.

```bash
​```
$ git config --global user.name {유저네임}
$ git config --global user.email {이메일}
​```
```

* 일반적으로 `{유저네임}`, `{이메일}`에는 github 정보를 넣는다.

* 상태 알아보려면 

```bash

$ git status
```



##  1. 저장소 생성

```bash
$ git init
Reinitialized existing Git repository in C:/Users/student/.git
```

파일 저장하려는 곳에서 `우 클릭` `Git bash` 하여 실행하기.



## 2. Add

> 커밋 대상 파일을 `staging area`로 이동 시킨다.
>
> 즉, 이력을 남길 파일을 담아 놓는 것이다.

`.`은 현재 디렉토리(폴더)를 뜻한다.  


```bash
$ git add . # 현재 디렉토리 모두 stage
$ git add git.md # 특정 파일만 stage
$ git add images/ # 특정 폴더만 stage
```
항상 `git status` 명령어를 통해 상태를 확인하자.

```bash
$ git status
Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   Git.md
        new file:   "Markdown \355\231\234\354\232\251\353\262\225.md"
        new file:   "\354\202\254\354\247\204\353\201\214\354\226\264\354\230\244\353\212\224\352\261\260.jpg" # 한글을 인식하기위해 유니코드로 변환되어서 숫자가 나온것
```
## 3. Commit
> Git에서 이력을 남기기 위해서는 commit을 진행

``` bash
$ git commit -m 'Git 기초'
[master (root-commit) 2df18bd] Git 기초
 3 files changed, 148 insertions(+)
 create mode 100644 Git.md
 create mode 100644 "Markdown \355\231\234\354\232\251\353\262\225.md"
 create mode 100644 "\354\202\254\354\247\204\353\201\214\354\226\264\354\230\244\353\212\224\352\261\260.jpg"
```

* 이력을 확인하기 위해서는 `git log`를 활용한다.

```bash
$ git log
commit 2df18bdef10bb98785e97fae44cf455bd6ef0261 (HEAD -> master)
Author: Kingkong92 <hopeone1215@gmail.com>
Date:   Thu Dec 5 12:38:28 2019 +0900

    Git 기초

```

## Git 원격 저장소 활용하기

### 0. 기본설정

> 원격 저장소를 생성한다. (예 - Github)

```bash
git remote add origin https://github.com/Kingkong92/TIL.git
```

## 1. 원격 저장소 등록

`origin`이라는 이름으로 해당 url을 원격 저장소로 등록



최초에 한번만 하면 된다.

```bash
$ git remote add origin https://github.com/Kingkong92/TIL.git
```

```bash
$ git remote -v # 원격 저장소 목록
origin  https://github.com/Kingkong92/TIL.git (fetch)
origin  https://github.com/Kingkong92/TIL.git (push)

```

## 2. 원격 저장소 push

앞으로 변경되는 사항이 있으면 항상 `add`, `commit`, `push`를 진행한다.

```bash
$ git push -u origin master
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 273.83 KiB | 21.06 MiB/s, done.
Total 5 (delta 0), reused 0 (delta 0)
To https://github.com/Kingkong92/TIL.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.

```

