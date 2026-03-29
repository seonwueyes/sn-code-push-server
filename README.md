# Visual Studio App Center CodePush Standalone Version

[CodePush](https://learn.microsoft.com/en-us/appcenter/distribution/codepush/)
는 React Native 개발자가 앱 업데이트를 사용자 기기에 직접 배포할 수 있도록 해주는 App Center의 기능이다.
이 기능은 두 가지로 구성되어 있다:

개발자가 앱 업데이트(JS, HTML, CSS, 이미지 변경 등)를 배포할 수 있는 기능.
[CodePush React Native Client SDK](https://github.com/Microsoft/react-native-code-push) 로 앱 내부에서 업데이트를 조회할 수 있도록 해주는 기능.

App Center가 완전히 종료된 이후에도 개발자들이 CodePush 기능을 계속 사용할 수 있도록,
App Center와 독립적으로 배포 및 사용할 수 있는 CodePush Server의 standalone 버전이 새롭게 만들어졌다.

이 standalone 버전의 코드는 해당 저장소(repository)에서 확인할 수 있으며,
기존 [CodePush React Native Client SDK](https://github.com/Microsoft/react-native-code-push)와 완전히 호환된다.

## Getting Started

### CodePush Server

api 하위 디렉토리에 위치한 CodePush 서버는
개발자가 직접 CodePush 업데이트를 빌드, 배포 및 관리할 수 있도록 해준다.

CodePush 서버에 대한 자세한 정보(설치 방법 및 사용 방법 포함)는
api 디랙토리 내용을 참고하면 된다.

### CodePush CLI

cli 하위 디렉토리에 위치한 CodePush CLI는
개발자가 CodePush 서버와 상호작용할 수 있도록 해주는 명령줄 도구이다.

CodePush CLI에 대한 자세한 정보(설치 방법 및 사용 방법 포함)는 [CodePush CLI README](./cli/README.md)
를 참고하면 된다.
